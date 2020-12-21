# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="JupyterLab Server"
HOMEPAGE="https://github.com/jupyter-server/jupyter_server"
SRC_URI="https://github.com/jupyter-server/jupyter_server/archive/${PV}.tar.gz -> jupyter_server-${PV}.tar.gz"
#	https://roofn3d.gis.tu-berlin.de/jupyterlab-nodemodules.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT=network-sandbox

DEPEND="dev-python/ipython_genutils
	>=dev-python/jupyter_core-4.4.0
	>=dev-python/jupyter_client-6.1.1
	>=dev-python/pyzmq-17
	>=dev-python/jinja-2.0
	dev-python/nbformat
	dev-python/nbconvert
	dev-python/anyio
	dev-python/prometheus_client
	>=dev-python/terminado-0.8.3
	dev-python/send2trash
	>=dev-python/traitlets-4.2.1"
RDEPEND="${DEPEND}"
#	>=www-servers/tornado-5.0

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

src_prepare(){
#	mv ${S}/../node_modules ${S}/jupyterlab/staging/
	eapply "${FILESDIR}/jupter_server-1.1.0_find_packages.patch"
	eapply_user
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
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






