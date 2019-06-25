# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Check_MK Server part for monitoring your systems"
HOMEPAGE="https://checkmk.com/"

MY_PV="${PV/_p/p}"
MY_P="check-mk-raw-${MY_PV}.cre"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
#IUSE="apache_status inventory logwatch mysql nfsexports oracle postgres smart +xinetd zypper"

RDEPEND="dev-perl/XML-SAX-Expat
	dev-perl/XML-NamespaceSupport
	dev-perl/HTML-Tagset
	dev-perl/Encode-Locale
	dev-perl/IO-HTML
	dev-perl/LWP-MediaTypes
	dev-perl/LWP-UserAgent-Cached
	dev-perl/IO-Socket-SSL
	dev-perl/File-Listing
	dev-perl/Mozilla-CA
	dev-perl/HTTP-Daemon
	dev-perl/HTTP-Negotiate
	dev-perl/WWW-RobotRules
	dev-perl/List-MoreUtils
	dev-perl/File-Remove
	dev-perl/Module-Install
	dev-python/python-ldap
	dev-db/postgresql
	app-crypt/mit-krb5
	dev-libs/boost
	dev-db/mysql
	media-libs/jpeg
	media-libs/libpng
	x11-libs/pango
	net-analyzer/rrdtool[graph,perl]
	media-libs/gd[jpeg,png,truetype,fontconfig]
	media-gfx/graphviz[perl,python,pdf]
	app-eselect/eselect-php[apache2]
	net-analyzer/net-snmp[perl]
	www-servers/apache[apache2_modules_version,apache2_modules_access_compat]
	dev-lang/php[sockets,mysql,gd,pdo,apache2,cgi,sqlite,cli]
	sys-process/vixie-cron
	sys-process/time
	net-analyzer/traceroute
	net-misc/curl
	dev-util/dialog
	net-dns/bind-tools
	net-analyzer/fping
	dev-db/libdbi
	dev-libs/libevent
	dev-libs/libltdl
	dev-perl/Net-SNMP
	dev-perl/Pango
	sys-libs/readline:5
	net-analyzer/net-snmp
	sys-apps/util-linux
	dev-php/pear
	dev-libs/libxml2
	dev-python/pyro
	net-misc/rsync
	net-nds/rpcbind
	app-arch/unzip
	sys-apps/xinetd
	net-dialup/freeradius
	net-libs/libpcap
	app-arch/rpm
	sys-devel/binutils
	app-arch/lcab
	gnome-extra/libgsf
	dev-libs/glib
	app-arch/cpio
	sys-devel/flex
	app-text/poppler
	dev-libs/libffi
	app-shells/bash:*
	"
DEPEND="${RDEPEND}"

SRC_URI="https://checkmk.com/support/${MY_PV}/${MY_P}.tar.gz"
#SRC_URI="http://mathias-kettner.de/support/${MY_PV}/${MY_P}.tar.gz"

src_unpack() {
	# check_mk is a tarball containing tarballs
	unpack ${A}
	S="${WORKDIR}/${MY_P}"
#	unpack "${WORKDIR}"/${MY_P}/packages/check_mk/check_mk-${MY_PV}.tar.gz
	cp ${FILESDIR}/Gentoo_.mk "${WORKDIR}"/${MY_P}/omd/distros/
	rm "${WORKDIR}"/${MY_P}/omd/packages/perl-modules/src/version-*
	#ls "${WORKDIR}"/${MY_P}/omd/packages/perl-modules/src/
	cp ${FILESDIR}/version-0.9924.tar.gz "${WORKDIR}"/${MY_P}/omd/packages/perl-modules/src/

	cp ${FILESDIR}/Makefile_boost "${WORKDIR}"/${MY_P}/omd/packages/boost/Makefile
	cp ${FILESDIR}/Makefile_python_modules "${WORKDIR}"/${MY_P}/omd/packages/python-modules/Makefile
	cp ${FILESDIR}/Pillow-5.1.0.tar.gz "${WORKDIR}"/${MY_P}/omd/packages/python-modules/src/

	#mkdir -p "${S}" || die
	#cd "${S}" || die
	#unpack "${WORKDIR}"/check_mk-${MY_PV}/agents.tar.gz
	#mkdir -p "${S}"/doc || die
	#cd "${S}"/doc || die
	#unpack "${WORKDIR}"/check_mk-${MY_PV}/doc.tar.gz
}

src_configure() { :; }

src_compile() {
	S="${WORKDIR}/${MY_P}/omd/"
	cd ${S}
	emake
	cp ${FILESDIR}/nagvis_install.sh "${WORKDIR}"/${MY_P}/omd/packages/nagvis/nagvis-1.9.11/install.sh
	emake pack
}

src_install() {

	doins -r ${WORKDIR}/${MY_P}/omd/destdir/*
	# Install agent related files
#	newbin check_mk_agent.linux check_mk_agent

#	keepdir /usr/lib/check_mk_agent/local
#	dodir /usr/lib/check_mk_agent/plugins
#	dodir /etc/check_mk

#	dodoc doc/{AUTHORS,COPYING,ChangeLog}
#	docompress

#	if use xinetd; then
#		insinto /etc/xinetd.d
#		newins cfg_examples/xinetd.conf check_mk
#		systemd_dounit cfg_examples/systemd/check_mk{.socket,@.service}
#	fi

	# Install the check_mk_agent logwatch plugin
#	if use logwatch; then
#		insinto /etc/check_mk
#		doins cfg_examples/logwatch.cfg
#		exeinto /usr/lib/check_mk_agent/plugins
#		doexe plugins/mk_logwatch
#	fi

	# Install any other useflag-enabled agent plugins
#	exeinto /usr/lib/check_mk_agent/plugins
#	use inventory && newexe plugins/mk_inventory.linux mk_inventory
#	use smart && doexe plugins/smart
#	use mysql && doexe plugins/mk_mysql
#	use postgres && doexe plugins/mk_postgres
#	use apache_status && doexe plugins/apache_status
#	use zypper && doexe plugins/mk_zypper
#	use oracle && doexe plugins/mk_oracle
#	use nfsexports && doexe plugins/nfsexports
}
