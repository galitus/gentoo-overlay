# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="PDAL's Python Extension"
HOMEPAGE="https://github.com/PDAL/python"
SRC_URI="https://github.com/PDAL/python/archive/${PV}.tar.gz -> pypdal-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sci-libs/pdal[python]
	dev-python/packaging
	dev-python/scikit-build"
RDEPEND="${DEPEND}"

S=${WORKDIR}/python-${PV}
