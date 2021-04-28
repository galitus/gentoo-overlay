# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="A collection of astronomy-related routines in Python"
HOMEPAGE="https://github.com/sczesla/PyAstronomy"
SRC_URI="https://github.com/sczesla/PyAstronomy/archive/v_0-16-0.tar.gz -> PyAstronomy-0.16.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/quantities
	>=dev-python/numpy-1.5
	>=dev-python/matplotlib-1.0
	>=dev-python/quantities-0.10.1
	>=dev-python/numpydoc-0.4
	>=dev-python/mock-1.0.1
	>=dev-python/six-1.10.0
	dev-python/sphinx
	dev-python/nbsphinx
	dev-python/bidict
	sci-libs/scipy
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/PyAstronomy-v_0-16-0
