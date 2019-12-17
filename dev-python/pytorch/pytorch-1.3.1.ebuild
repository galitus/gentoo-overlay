# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit cmake-utils git-r3
#inherit distutils-r1 toolchain-funcs git-r3

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="https://github.com/pytorch/pytorch"
#SRC_URI="https://github.com/pytorch/pytorch/archive/v1.3.1.tar.gz -> pytorch-1.3.1.tar.gz"
#	https://roofn3d.gis.tu-berlin.de/json5-nodemodules.tar.gz"
EGIT_REPO_URI="https://github.com/pytorch/pytorch"
EGIT_BRANCH="v1.3.1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/future\
	dev-python/typing\
	dev-python/six\
	dev-python/setuptools\
	dev-python/pyyaml\
	dev-python/numpy\
	dev-python/requests"
RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#S="${WORKDIR}/vision-${PV}"

#src_prepare(){
#	mv ${S}/../node_modules ${S}
#	eapply_user
#	eapply "${FILESDIR}/pyjson5-0.8.5_exclude_tests_from_install.patch"
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
#}

src_prepare() {
	eapply "${FILESDIR}/fix_autodetection.patch"

	cmake-utils_src_prepare
}

src_configure(){
       local mycmakeargs=(
		-DCUDA_GPU_DETECT_OUTPUT=7.5
#		-DUSE_SYSTEM_NCCL=1
	)
        cmake-utils_src_configure
}


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
