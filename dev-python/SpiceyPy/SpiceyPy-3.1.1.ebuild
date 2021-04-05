# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="SpiceyPy is a Python wrapper for the NAIF C SPICE Toolkit (N66), compatible with Python 2 and 3, written using ctypes."
HOMEPAGE="https://github.com/AndrewAnnex/SpiceyPy"
SRC_URI="https://github.com/AndrewAnnex/SpiceyPy/archive/v${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sci-libs/cspice
	>=dev-python/numpy-1.17.0
	>=dev-python/pandas-0.24.0
	>=dev-python/pytest-5.4.0
	>=dev-python/coverage-5.1.0
	>=dev-python/codecov-2.1.0
	>=dev-python/setuptools-40.6.3"
RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#src_prepare(){
#	eapply_user
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
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





