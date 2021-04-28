# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PHP_EXT_NAME="mapi"
PHP_EXT_INI="yes"
USE_PHP="php7-4"

PYTHON_COMPAT=( python3_7 python3_8 )

inherit autotools eutils flag-o-matic php-ext-source-r3 python-single-r1

PHP_EXT_S="${S}/php7-ext"

DESCRIPTION="Open Source Groupware Solution"
HOMEPAGE="http://kopano.io/"

SRC_URI_TAG="kopanocore-8.6.81"

SRC_URI="https://stash.kopano.io/rest/api/latest/projects/KC/repos/kopanocore/archive?at=refs%2Fheads%2Fkc-8.6.x&prefix=${P}&format=tar.gz -> ${P}.tar.gz"
#SRC_URI="https://stash.kopano.io/rest/archive/latest/projects/KC/repos/kopanocore/archive?at=refs%2Ftags%2F${SRC_URI_TAG}&prefix=${P}&format=tar.gz -> ${P}.tar.gz"

#KOPANO_USER=${KOPANO_USER:-kopano}
#KOPANO_GROUP=${KOPANO_GROUP:-kopano}

KOPANO_SERVICES="dagent gateway ical monitor presence search server spooler"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="debug icu kerberos ldap logrotate s3 static tcmalloc"

RDEPEND="${PYTHON_DEPS}
	acct-group/kopano
	acct-user/kopano
	logrotate? ( app-admin/logrotate )
	app-arch/unzip
	app-text/catdoc
	app-text/poppler[utils]
	app-text/xmlto[text]
	dev-libs/boost
	icu? ( dev-libs/icu )
	>=dev-cpp/libvmime-0.9.2[smtp]
	dev-lang/python:2.7
	dev-lang/swig
	>=dev-libs/libical-0.44
	dev-libs/libxml2
	dev-libs/openssl
	dev-libs/xapian-bindings[python]
	>=net-libs/gsoap-2.8.39
	net-misc/curl
	sys-libs/e2fsprogs-libs
	sys-libs/zlib
	dev-python/flask
	>=dev-python/python-daemon-1.6
	dev-python/python-dateutil
	dev-python/python-magic
	tcmalloc? ( dev-util/google-perftools )
	s3? ( net-libs/libs3 )
	ldap? ( net-nds/openldap )
	virtual/httpd-php:7.1
	kerberos? ( virtual/krb5 )
	virtual/mysql
	dev-libs/jsoncpp"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	sys-devel/gettext"
#	python_single_target_python2_7? ( dev-python/bsddb3 )

pkg_setup() {
	python-single-r1_pkg_setup

	enewgroup "${KOPANO_GROUP}"
	enewuser "${KOPANO_USER}" -1 -1 "/var/lib/kopano" "${KOPANO_GROUP}"
}

src_prepare() {
	local slot
	for slot in $(php_get_slots); do
		rm -rf "${WORKDIR}/${slot}" || die
		ln -s "${PHP_EXT_S}" "${WORKDIR}/${slot}" || die
	done

	epatch "${FILESDIR}/kopanocore-8.6.80-automake.patch"
	epatch "${FILESDIR}/new_fix.patch"
	use kerberos && epatch "${FILESDIR}/kopanocore-8.2.0-kerberos.patch"
#	use python_single_target_python2_7 && epatch "${FILESDIR}/kopanocore-8.3.0-python2_7.patch"
	epatch "${FILESDIR}/kopanocore-8.2.0-search.patch"
	eapply_user
	eautoreconf
}

src_configure() {
	append-flags -fpermissive
	econf \
		--enable-release \
		--enable-epoll \
		--with-userscript-prefix=/etc/kopano/userscripts \
		--with-quotatemplate-prefix=/etc/kopano/quotamails \
		--with-searchscripts-prefix=/etc/kopano/searchscripts \
		$(use_enable debug)
		$(use_enable static)
#		$(use_enable icu) \
#		--enable-unicode \
		PHP_EXT_S="${S}/php7-ext"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"

	php-ext-source-r3_createinifiles

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}"/kopano.logrotate kopano || die "Failed to install logrotate"
	else
		rm "${D}/etc/logrotate.d/kopano"
	fi
	if use ldap; then
		insinto /etc/openldap/schema
		doins "${S}"/installer/ldap/kopano.* || die "Failed to install ldap schema files"
	fi

	dodir /etc/kopano
	insinto /etc/kopano
	doins "${S}"/installer/linux/*.cfg || die "Failed to install config files"
	fowners -Rf "${KOPANO_USER}":"root" "/etc/kopano"

	dodir /var/log/kopano
	keepdir /var/log/kopano
	fowners -Rf "${KOPANO_USER}":"root" "/var/log/kopano"

	dodir /var/lib/kopano
	keepdir /var/lib/kopano
	dodir /var/lib/kopano/spooler/plugins
	dodir /var/lib/kopano/dagent/plugins
	fowners -Rf "${KOPANO_USER}":"root" "/var/lib/kopano"

	for service in ${KOPANO_SERVICES}; do
		newconfd "${FILESDIR}/kopano-${service}.confd" "kopano-${service}"
		newinitd "${FILESDIR}/kopano-${service}.initd" "kopano-${service}"
	done
}

pkg_postinst() {
	elog
	elog "Kopano Core has been successfully emerged!"
	elog
	elog "Kopano Core replaces the former ZCP package."
	elog
	elog "Please check the following URL for how to migrate:"
	elog "    https://kb.kopano.io/display/WIKI/Migrating+from+ZCP+to+Kopano"
	elog
}
