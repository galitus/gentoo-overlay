# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
#PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit toolchain-funcs

DESCRIPTION="configurable-http-proxy (CHP) provides you with a way to update and manage a proxy table using a command line interface or REST API."
HOMEPAGE="https://github.com/jupyterhub/configurable-http-proxy"
SRC_URI="https://github.com/jupyterhub/configurable-http-proxy/archive/${PV}.tar.gz -> configure-http-proxy-${PV}.tar.gz"
#	https://roofn3d.gis.tu-berlin.de/proxy-nodemodules.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT=network-sandbox

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#S=${WORKDIR}

src_prepare(){
	mv ${S}/../node_modules ${S}
	eapply_user
#	eapply "${FILESDIR}/pyjson5-0.8.5_exclude_tests_from_install.patch"
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
}

src_compile(){
	npm install
#	npm install --global
#	npm install json5
}

src_install(){
	insinto /etc/conf.d/
	newins ${FILESDIR}/${PN}.conf ${PN}
	insinto /etc/init.d/
	newins ${FILESDIR}/${PN}.init ${PN}
	insinto /usr/lib64/node_modules/${PN}
	doins -r node_modules
	doins -r bin
	doins -r lib
	doins index.js
	doins package.json
	dosym /usr/lib64/node_modules/${PN}/bin/configurable-http-proxy /usr/bin/configurable-http-proxy
	fperms +x /usr/lib64/node_modules/${PN}/bin/configurable-http-proxy
}

#python_configure_all() {
#        tc-export CC
#        "${PYTHON}" config_unix.py --prefix /usr || die "Configuration failed"
#}

#python_install_all() {
#        distutils-r1_python_install_all
#        insinto /usr/share/doc/${PF}/examples
#        doins test/*
#}






