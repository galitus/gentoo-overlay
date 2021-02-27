# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9)

inherit distutils-r1 toolchain-funcs

DESCRIPTION="An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture."
HOMEPAGE="https://github.com/jupyterlab/jupyterlab/"
SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v${PV}.tar.gz -> jupyterlab-${PV}.tar.gz"
#	https://roofn3d.gis.tu-berlin.de/jupyterlab-nodemodules.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#RESTRICT=network-sandbox

DEPEND="dev-python/ipython
	dev-python/jupyter-packaging
        dev-python/jupyter_core
	~dev-python/jupyter_server-1.1.0
        =dev-python/jupyterlab_server-2.0.0
        >=dev-python/jinja-2.10
        >=www-servers/tornado-6.1
	>=dev-python/nbclassic-0.2"
#       >=dev-python/notebook-4.3.1

RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#src_prepare(){
#	mv ${S}/../node_modules ${S}/jupyterlab/staging/
#	eapply_user
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
#}

#src_compile(){
#	distutils-r1_python_compile
#}
#python_compile() {
#    distutils-r1_python_compile
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






