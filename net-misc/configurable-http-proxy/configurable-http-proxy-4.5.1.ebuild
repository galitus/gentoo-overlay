# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
#PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit toolchain-funcs

DESCRIPTION="configurable-http-proxy (CHP) provides you with a way to update and manage a proxy table using a command line interface or REST API."
HOMEPAGE="https://github.com/jupyterhub/configurable-http-proxy"
SRC_URI="https://github.com/jupyterhub/configurable-http-proxy/archive/refs/tags/${PV}.tar.gz -> configure-http-proxy-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT=network-sandbox

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_prepare(){
	mv "${S}"/../node_modules "${S}"
	eapply_user
}

src_compile(){
	npm install
}

src_install(){
	newconfd "${FILESDIR}/${PN}.conf" "${PN}"
	newinitd "${FILESDIR}/${PN}.init" "${PN}"
	insinto /usr/lib64/node_modules/"${PN}"
	doins -r node_modules
	doins -r bin
	doins -r lib
	doins index.js
	doins package.json
	dosym "/usr/lib64/node_modules/${PN}/bin/configurable-http-proxy" /usr/bin/configurable-http-proxy
	fperms +x "/usr/lib64/node_modules/${PN}/bin/configurable-http-proxy"
}
