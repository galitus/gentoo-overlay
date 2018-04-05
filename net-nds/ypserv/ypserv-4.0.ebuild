# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="Network Information Service server"
HOMEPAGE="http://www.linux-nis.org/nis/"
SRC_URI="http://www.linux-nis.org/download/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE="systemd"

DEPEND="
	>=net-nds/yp-tools-4.0
	>=sys-libs/gdbm-1.8.0
	systemd? ( >=sys-apps/systemd-209 )
"
RDEPEND="${DEPEND}
	 || ( net-nds/rpcbind net-nds/portmap )
"

PATCHES=(
	# Make systemd not automagic
	"${FILESDIR}"/${PN}-4.0-systemd.patch

	# From Fedora
	"${FILESDIR}"/${PN}-4.0-headers.patch
)

src_prepare() {
	default
	sed -i -e 's/-Werror//' lib/Makefile.am || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable systemd)
}

src_install() {
	default
	einstalldocs

	insinto /etc
	doins etc/ypserv.conf etc/netgroup etc/netmasks
	insinto /var/yp
	newins etc/securenets securenets.default

	newconfd "${FILESDIR}/ypserv.confd" ypserv
	newconfd "${FILESDIR}/rpc.yppasswdd.confd" rpc.yppasswdd
	newconfd "${FILESDIR}/rpc.ypxfrd.confd" rpc.ypxfrd

	newinitd "${FILESDIR}/ypserv" ypserv
	newinitd "${FILESDIR}/rpc.yppasswdd-r1" rpc.yppasswdd
	newinitd "${FILESDIR}/rpc.ypxfrd-2.23" rpc.ypxfrd

	echo "CONFIG_PROTECT=\"/var/yp/Makefile\"" > "${T}"/10ypserv
	doenvd "${T}"/10ypserv
}

pkg_preinst() {
	# This ebuilds installs an env file which CONFIG_PROTECTs /var/yp/Makefile,
	# but if the user is migrating from older ypserv, this won't take effect
	# immediately. Keep the older setup with Makefile.dist file and ask the user
	# to migrate.
	if [ -f "${ROOT}/var/yp/Makefile.dist" ]; then
		mv "${D}/var/yp/Makefile" "${D}/var/yp/Makefile.dist" \
			|| die "mv failed"
		cp "${ROOT}/var/yp/Makefile" "${D}/var/yp/Makefile" \
			|| die "cp failed"
		elog "Please remove ${ROOT}/var/yp/Makefile.dist after making sure that"
		elog "${ROOT}/var/yp/Makefile looks fine to you. It is now"
		elog "CONFIG_PROTECTed, so further changes should be managed with"
		elog "usual config management tools like etc-update or dispatch-conf."
	fi
}

pkg_postinst() {
	einfo "To complete setup, you will need to edit /var/yp/securenets,"
	einfo "/etc/conf.d/ypserv, /etc/ypserv.conf, /etc/conf.d/rpc.yppasswdd"
	einfo "and possibly /var/yp/Makefile."

	einfo "To start the services at boot, you need to enable ypserv and optionally"
	einfo "the rpc.yppasswdd and/or rpc.ypxfrd services"
}
