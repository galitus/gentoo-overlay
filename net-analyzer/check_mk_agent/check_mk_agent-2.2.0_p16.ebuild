# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Agent to report data to Check_MK for monitoring"
HOMEPAGE="http://mathias-kettner.de/check_mk.html"

MY_PV="${PV/_p/p}"
MY_P="check-mk-raw-${MY_PV}.cre"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="apache_status dhcpd dnsclient docker inventory iptables logwatch mysql nfsiostat nfsexports oracle postgres smart +xinetd zypper"

RDEPEND="!!net-analyzer/check_mk
	app-shells/bash:*
	xinetd? ( || ( sys-apps/xinetd sys-apps/systemd ) )
	dnsclient? ( net-dns/bind-tools )
	docker? ( app-containers/docker )
	iptables? ( net-firewall/iptables )
	nfsiostat? ( net-fs/nfs-utils )
	dhcpd? ( net-misc/dhcp )
	"
DEPEND="${RDEPEND}"

SRC_URI="https://download.checkmk.com/checkmk/${MY_PV}/${MY_P}.tar.gz"

S="${WORKDIR}/check-mk-raw-${MY_PV}.cre"

src_unpack() {
	# check_mk is a tarball containing tarballs
	unpack ${A}
#	unpack "${WORKDIR}"/${MY_P}/check_mk-${MY_PV}.tar.gz
#	mkdir -p "${S}" || die
#	cd "${S}" || die
#	unpack "${WORKDIR}"/check_mk-${MY_PV}/agents.tar.gz
#	mkdir -p "${S}"/doc || die
#	cd "${S}"/doc || die
#	unpack "${WORKDIR}"/check_mk-${MY_PV}/doc.tar.gz
}

src_prepare() {
#	eapply "${FILESDIR}"/smart_multithread.patch
	eapply_user
	true
}

src_compile() {
	true
}

src_install() {
	# Install agent related files
	newbin agents/check_mk_agent.linux check_mk_agent

	keepdir /usr/lib/check_mk_agent/local
	dodir /usr/lib/check_mk_agent/plugins
	dodir /etc/check_mk

	#dodoc doc/{AUTHORS,COPYING,ChangeLog}
	docompress

	if use xinetd; then
		insinto /etc/xinetd.d
		newins ${FILESDIR}/xinetd_checkmk check_mk
#		systemd_dounit cfg_examples/systemd/check_mk{.socket,@.service}
	fi

	# Install the check_mk_agent logwatch plugin
	if use logwatch; then
		insinto /etc/check_mk
		doins agents/cfg_examples/logwatch.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe agents/plugins/mk_logwatch.py
	fi

	# Install any other useflag-enabled agent plugins
	exeinto /usr/lib/check_mk_agent/plugins
	use inventory && newexe agents/plugins/mk_inventory.linux mk_inventory
	use smart && doexe agents/plugins/smart
	use mysql && doexe agents/plugins/mk_mysql
	use postgres && doexe agents/plugins/mk_postgres.py
	use zypper && doexe agents/plugins/mk_zypper
	use oracle && doexe agents/plugins/mk_oracle
	use nfsexports && doexe agents/plugins/nfsexports
	use dnsclient && doexe agents/plugins/dnsclient
	use iptables && doexe agents/plugins/mk_iptables
	use dhcpd && doexe agents/plugins/isc_dhcpd.py
	if use apache_status; then
		insinto /etc/check_mk
		doins agents/cfg_examples/apache_status.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe agents/plugins/apache_status.py
	fi
	if use docker; then
		insinto /etc/check_mk
		doins agents/cfg_examples/docker*.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe agents/plugins/mk_docker.py
	fi
	use nfsiostat && doexe agents/plugins/mk_nfsiostat
	doexe agents/plugins/mk_logins
	doexe agents/plugins/mk_filestats.py
	doexe agents/plugins/mk_cups_queues

	exeinto /usr/bin
	doexe agents/waitmax
}
