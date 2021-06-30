# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9 )

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
