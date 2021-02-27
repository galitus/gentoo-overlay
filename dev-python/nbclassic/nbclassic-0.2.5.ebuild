# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9)

inherit distutils-r1 toolchain-funcs

DISTUTILS_USE_SETUPTOOLS=bdepend

DESCRIPTION="Jupyter Notebook as a Jupyter Server Extension"
HOMEPAGE="https://github.com/jupyterlab/nbclassic"
SRC_URI="https://github.com/jupyterlab/nbclassic/archive/${PV}.tar.gz -> nbclassic-${PV}.tar.gz"
#	https://roofn3d.gis.tu-berlin.de/jupyterlab-nodemodules.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#RESTRICT=network-sandbox

DEPEND=""
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

#python_install_all() {
#        distutils-r1_python_install_all
#
#        mkdir -p "${ED}"/etc/ || die
#        mv "${ED}"/usr/etc/jupyter "${ED}"/etc/ || die
#        rmdir "${ED}"/usr/etc || die
#}

