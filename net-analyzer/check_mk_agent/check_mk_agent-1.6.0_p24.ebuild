# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit systemd

DESCRIPTION="Agent to report data to Check_MK for monitoring"
HOMEPAGE="http://mathias-kettner.de/check_mk.html"

MY_PV="${PV/_p/p}"
MY_P="check-mk-raw-${MY_PV}.cre"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="apache_status dhcpd dnsclient docker inventory iptables logwatch mysql nfsiostat nfsexports oracle postgres smart +xinetd zypper"

RDEPEND="!!net-analyzer/check_mk
	app-shells/bash:*
	xinetd? ( || ( sys-apps/xinetd sys-apps/systemd ) )
	dnsclient? ( net-dns/bind-tools )
	docker? ( app-emulation/docker )
	iptables? ( net-firewall/iptables )
	nfsiostat? ( net-fs/nfs-utils )
	dhcpd? ( net-misc/dhcp )
	"
DEPEND="${RDEPEND}"

SRC_URI="http://mathias-kettner.de/support/${MY_PV}/${MY_P}.tar.gz"

src_unpack() {
	# check_mk is a tarball containing tarballs
	unpack ${A}
	unpack "${WORKDIR}"/${MY_P}/check_mk-${MY_PV}.tar.gz
	mkdir -p "${S}" || die
	cd "${S}" || die
	unpack "${WORKDIR}"/check_mk-${MY_PV}/agents.tar.gz
	mkdir -p "${S}"/doc || die
	cd "${S}"/doc || die
	unpack "${WORKDIR}"/check_mk-${MY_PV}/doc.tar.gz
}

src_prepare() {
	eapply "${FILESDIR}"/smart_multithread.patch
	eapply_user
}

src_install() {
	# Install agent related files
	newbin check_mk_agent.linux check_mk_agent

	keepdir /usr/lib/check_mk_agent/local
	dodir /usr/lib/check_mk_agent/plugins
	dodir /etc/check_mk

	dodoc doc/{AUTHORS,COPYING,ChangeLog}
	docompress

	if use xinetd; then
		insinto /etc/xinetd.d
		newins cfg_examples/xinetd.conf check_mk
		systemd_dounit cfg_examples/systemd/check_mk{.socket,@.service}
	fi

	# Install the check_mk_agent logwatch plugin
	if use logwatch; then
		insinto /etc/check_mk
		doins cfg_examples/logwatch.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe plugins/mk_logwatch
	fi

	# Install any other useflag-enabled agent plugins
	exeinto /usr/lib/check_mk_agent/plugins
	use inventory && newexe plugins/mk_inventory.linux mk_inventory
	use smart && doexe plugins/smart
	use mysql && doexe plugins/mk_mysql
	use postgres && doexe plugins/mk_postgres
	use zypper && doexe plugins/mk_zypper
	use oracle && doexe plugins/mk_oracle
	use nfsexports && doexe plugins/nfsexports
	use dnsclient && doexe plugins/dnsclient
	use iptables && doexe plugins/mk_iptables
	use dhcpd && doexe plugins/isc_dhcpd
	if use apache_status; then
		insinto /etc/check_mk
		doins cfg_examples/apache_status.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe plugins/apache_status
	fi
	if use docker; then
		insinto /etc/check_mk
		doins cfg_examples/docker*.cfg
		exeinto /usr/lib/check_mk_agent/plugins
		doexe plugins/mk_docker.py
	fi
	use nfsiostat && doexe plugins/mk_nfsiostat
	doexe plugins/mk_logins
}
