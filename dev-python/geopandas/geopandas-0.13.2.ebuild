# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_10 python3_11 python3_12 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Python tools for geographic data"
HOMEPAGE="https://github.com/geopandas/geopandas"
SRC_URI="https://github.com/geopandas/geopandas/releases/download/v${PV}/geopandas-${PV}.tar.gz -> geopandas-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-python/pyproj-3.0.1
	>=dev-python/shapely-1.7.1
	>=dev-python/fiona-1.8.19
	>=dev-python/pandas-1.1.0"
RDEPEND="${DEPEND}"
