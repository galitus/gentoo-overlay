# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Python tools for geographic data"
HOMEPAGE="https://github.com/geopandas/geopandas"
SRC_URI="https://github.com/geopandas/geopandas/releases/download/v${PV}/geopandas-${PV}.tar.gz -> geopandas-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-python/pyproj-2.2.0
	>=dev-python/shapely-1.6
	>=sci-libs/Fiona-1.8
	>=dev-python/pandas-0.24.0"
RDEPEND="${DEPEND}"
