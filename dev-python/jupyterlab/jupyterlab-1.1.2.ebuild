# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Multi-user server for Jupyter notebooks"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub"
SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v1.1.2.tar.gz -> jupyterlab-1.1.2.tar.gz
	https://roofn3d.gis.tu-berlin.de/jupyterlab-nodemodules.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="net-libs/nodejs
	>=dev-python/notebook-4.3.1
	=dev-python/jupyterlab_server-1.0.6
	>=dev-python/jinja-2.10
	<=www-servers/tornado-6.0"

RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

src_prepare(){
	mv ${S}/../node_modules ${S}/jupyterlab/staging/
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






