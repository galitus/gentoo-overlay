# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 git-r3

DESCRIPTION="Geospatial extension to SQLAlchemy with PostGIS support"
HOMEPAGE="https://geoalchemy-2.readthedocs.io/en/latest/"
#SRC_URI="https://github.com/geoalchemy/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/geoalchemy/${PN}"
EGIT_COMMIT="0.14.1"
#EGIT_BRANCH="0.12.5"
EGIT_SUBMODULES=( '*' )


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/shapely[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

RESTRICT="test"
# tests require a running PostgreSQL database

python_test() {
	py.test tests || die
}

python_install() {
    if use test; then
	rm -r "${BUILD_DIR}"/lib/tests || die
    fi
    distutils-r1_python_install
}
