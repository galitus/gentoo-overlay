# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

#inherit distutils-r1 toolchain-funcs
inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1 git-r3

DESCRIPTION="NumPy-like API accelerated with CUDA"
HOMEPAGE="https://github.com/cupy/cupy/"
#SRC_URI="https://github.com/cupy/cupy/archive/v${PV}.tar.gz -> cupy-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/cupy/cupy"
EGIT_COMMIT="v8.2.0"
EGIT_SUBMODULES=( '*' )
#EGIT_CLONE_TYPE="single+tags"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/fastrlock"
RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#S=${WORKDIR}

#src_prepare(){
#	mv ${S}/../node_modules ${S}
#	eapply_user
#	eapply "${FILESDIR}/pyjson5-0.8.5_exclude_tests_from_install.patch"
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
#}

#src_compile(){
#	npm install
#	npm install --global
#	npm install json5
#}

#src_install(){
#	insinto /usr/lib64/node_modules/json5/
#	doins -r *
#	dosym /usr/lib64/node_modules/json5/lib/cli.js /usr/bin/json5
#	fperms +x /usr/bin/json5
#}

#python_configure_all() {
#        tc-export CC
#        "${PYTHON}" config_unix.py --prefix /usr || die "Configuration failed"
#}

#python_install_all() {
#        distutils-r1_python_install_all
#        insinto /usr/share/doc/${PF}/examples
#        doins test/*
#}






