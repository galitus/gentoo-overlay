# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Rasterio reads and writes geospatial raster datasets"
HOMEPAGE="https://github.com/mapbox/rasterio"
SRC_URI="https://github.com/mapbox/rasterio/archive/${PV}.tar.gz -> rasterio-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/affine"
RDEPEND="${DEPEND}"
