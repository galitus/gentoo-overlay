# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

DESCRIPTION="Z-Push - open source push technology"
HOMEPAGE="https://github.com/Z-Hub/Z-Push"

ZPUSH_RELEASE="final"
ZPUSH_BASE_VERSION="2.6"
ZPUSH_VERSION="2.6.2"
ZPUSH_BUILD=""
ZPUSH_SUFFIX=""

#SRC_URI="http://download.z-push.org/${ZPUSH_RELEASE}/${ZPUSH_BASE_VERSION}/z-push-${ZPUSH_VERSION}${ZPUSH_SUFFIX}${ZPUSH_BUILD}.tar.gz"
#SRC_URI="https://stash.z-hub.io/rest/api/latest/projects/ZP/repos/z-push/archive?at=refs%2Ftags%2F${PV}&format=tar.gz -> ${P}.tar.gz"
#SRC_URI="https://stash.kopano.io/rest/api/latest/projects/ZHUB/repos/z-push/archive?at=refs%2Ftags%2F${PV}&format=tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/Z-Hub/Z-Push/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/Z-Push-${PV}"

LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""

BACKENDS="caldav  carddav  combined  imap  ipcmemcached  kopano  ldap  maildir  searchldap  sqlstatemachine  vcarddir"

DEPEND=">=virtual/httpd-php-7.4"

#src_unpack() {
#	mkdir ${S}
#        mv ${P}.tar.gz ${S}/
#        cd ${S}
#        unpack ${P}.tar.gz
#}

src_install() {
	webapp_src_preinst

	dodir "/var/log/z-push"
	dodir "/var/lib/z-push"

	insinto "${MY_HTDOCSDIR}"
	doins -r "${S}"/src/*

	webapp_serverowned -R "/var/log/z-push"
	webapp_serverowned -R "/var/lib/z-push"
	webapp_configfile "${MY_HTDOCSDIR}"/config.php
	webapp_serverowned "${MY_HTDOCSDIR}"/config.php
	webapp_configfile "${MY_HTDOCSDIR}"/policies.ini
	webapp_serverowned "${MY_HTDOCSDIR}"/policies.ini

	for backend in ${BACKENDS}; do
		webapp_configfile "${MY_HTDOCSDIR}"/backend/${backend}/config.php
		webapp_serverowned "${MY_HTDOCSDIR}"/backend/${backend}/config.php
	done

	webapp_src_install
}
