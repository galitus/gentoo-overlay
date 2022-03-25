# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Optuna: A hyperparameter optimization framework"
HOMEPAGE="https://github.com/optuna/optuna"
SRC_URI="https://github.com/optuna/optuna/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-python/alembic
	dev-python/cliff
	>=dev-python/cmaes-0.8.2
	dev-python/colorlog
	dev-python/numpy
	>=dev-python/packaging-20.0
	>=dev-python/scipy-1.5
	>=dev-python/sqlalchemy-1.1.0
	dev-python/tqdm
"

RDEPEND="${DEPEND}"
