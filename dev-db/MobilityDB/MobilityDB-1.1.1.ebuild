# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

POSTGRES_COMPAT=( {12..16} )
POSTGRES_USEDEP="server"
inherit postgres-multi cmake

AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="MobilityDB is a geospatial trajectory data management & analysis platform, built on PostgreSQL and PostGIS."
HOMEPAGE="https://github.com/MobilityDB/MobilityDB"
SRC_URI="https://github.com/MobilityDB/MobilityDB/archive/refs/tags/v1.1.1.tar.gz"
#EGIT_REPO_URI="https://github.com/MobilityDB/MobilityDB"

SLOT="0"
LICENSE="PostgreSQL"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=">=dev-db/postgresql-12[server]
	>=dev-build/cmake-3.7
	>=dev-db/postgis-3.0
	>=sci-libs/geos-3.8
	>=sci-libs/proj-6.1
	dev-libs/json-c
	sci-libs/gsl"

REQUIRED_USE=""

src_prepare() {
	default
	postgres-multi_src_prepare
}

src_configure() {
	postgres-multi_foreach econf "${myeconfargs[@]}"
}

src_compile() {
        postgres-multi_foreach emake
}

src_install() {
        postgres-multi_foreach emake DESTDIR="${D}" install
}
