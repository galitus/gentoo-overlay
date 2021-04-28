# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="NumPy-like API accelerated with CUDA"
HOMEPAGE="https://github.com/cupy/cupy/"
SRC_URI="https://github.com/cupy/cupy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=dev-python/fastrlock-0.5
	>=dev-python/optuna-2.0
	>=dev-python/scipy-1.4
"

RDEPEND="${DEPEND}"
