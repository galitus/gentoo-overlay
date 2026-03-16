# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=scikit-build-core

inherit distutils-r1 toolchain-funcs python-r1

DESCRIPTION="SpiceyPy is a Python wrapper for the NAIF C SPICE Toolkit (N66), compatible with Python 2 and 3, written using ctypes."
HOMEPAGE="https://github.com/AndrewAnnex/SpiceyPy"
SRC_URI="https://github.com/AndrewAnnex/SpiceyPy/archive/v${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="test"

DEPEND="sci-libs/cspice
	>=dev-python/numpy-1.23.5
	>=dev-python/cython-3.0.12
	>=dev-python/pandas-2.2.2
	>=dev-python/pytest-7.0.0
	>=dev-python/twine-6.1.0
	>=dev-python/coverage-7.0.0
	dev-python/black
	dev-python/scikit-build-core"
RDEPEND="${DEPEND}"
#	>=dev-python/codecov-2.1.0


python_configure_all() {
        DISTUTILS_ARGS=(
                        -DCSPICE_LIB=${EPREFIX}/usr/lib64/spice.so
                        -DCSPICE_INCLUDE_DIR=${EPREFIX}/usr/include/cspice
        )
}
