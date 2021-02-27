# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )
#PYTHON=python3.6
#EPYTHON=python3.6

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Top space statusbar for JupyterLab."
HOMEPAGE="https://github.com/jtpio/jupyterlab-topbar"
SRC_URI="https://github.com/jtpio/jupyterlab-topbar/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#DEPEND="net-libs/nodejs"
#RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#S=${WORKDIR}
#S="${WORKDIR}/jupyter-c-kernel-${PV}"

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
#	default
#	python_doscript jupyter_c_kernel/install_c_kernel
#	npm install
#	npm install --global
#	npm install json5
#}

#src_install(){
#	python_export_best
#	python_setup
#	distutils-r1_python_install
#	insinto /usr/share/jupyter/kernels/c/
#	doins ${FILESDIR}/kernel.json
#	python_doscript ${S}/jupyter_c_kernel/install_c_kernel
#	python3.6 ${S}/jupyter_c_kernel/install_c_kernel --sys-prefix
#	PYVERSION=$(echo "${EPYTHON}"|awk -F. '{print $2}')
#	echo "python version ${PYVERSION}"
#	PYVERSION=$(ver_rs 2 "${EPYTHON}")
#	${S}/build/scripts-3.${PYVERSION}/install_c_kernel --prefix /usr/share/jupyter/kernels/ --sys-prefix
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
