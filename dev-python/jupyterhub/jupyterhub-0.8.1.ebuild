# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Multi-user server for Jupyter notebooks"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub"
SRC_URI="https://github.com/jupyterhub/jupyterhub/archive/0.8.1.tar.gz -> jupyterhub-0.8.1.tar.gz
	https://roofn3d.gis.tu-berlin.de/nodemodules-0.8.1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="net-libs/nodejs
	dev-python/alembic
	>=dev-python/async_generator-1.8
	dev-python/certipy
	dev-python/entrypoints
	>=dev-python/jinja-2.0
	>=dev-python/real_oauth2-1.0
	dev-python/pamela
	dev-python/prometheus_client
	dev-python/python-dateutil
	dev-python/requests
	>=dev-python/sqlalchemy-1.1
	<=www-servers/tornado-5.0
	net-misc/configurable-http-proxy
	=dev-python/pyzmq-16.0.2
	dev-python/traitlets"
RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

src_prepare(){
	mv ${S}/../node_modules ${S}
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





