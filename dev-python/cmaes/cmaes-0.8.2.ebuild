# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation."
HOMEPAGE="https://github.com/CyberAgent/cmaes"
SRC_URI="https://github.com/CyberAgent/cmaes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=dev-python/numpy-1.2.0
"

RDEPEND="${DEPEND}"
