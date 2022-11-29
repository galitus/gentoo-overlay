# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit apache-module depend.apache tmpfiles
#eutils

DESCRIPTION="An Apache authentication module using Kerberos"
HOMEPAGE="http://modauthkerb.sourceforge.net/"
SRC_URI="mirror://sourceforge/modauthkerb/${P}.tar.gz"

LICENSE="BSD openafs-krb5-a HPND"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="virtual/krb5"
RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="11_${PN}"
APACHE2_MOD_DEFINE="AUTH_KERB"

DOCFILES="INSTALL README"

need_apache2

#src_unpack() {
#	unpack ${A}
#	cd "${S}"
#}

pkg_setup() {
	_init_apache2
	_init_apache2_late
}

src_prepare() {
	eapply "${FILESDIR}"/${P}-apache24.patch
	eapply "${FILESDIR}/v5.4-to-latest-cvs.patch"
	# bug #830208
	eapply "${FILESDIR}"/${P}-api-change-krb5.patch
	# bug #673066
	eapply "${FILESDIR}"/${P}-krb5pwd-double-free.patch

	eapply "${FILESDIR}"/mod_auth_kerb-5.4-new-rcopshack.patch
	default
}

src_configure() {
	CFLAGS="" APXS="${APXS}" econf --with-krb5=/usr --without-krb4 || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
        apache-module_src_install
}
