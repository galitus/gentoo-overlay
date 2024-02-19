# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

POSTGRES_COMPAT=( 9.6 {10..14} )
POSTGRES_USEDEP="server"
inherit autotools git-r3 postgres-multi

AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="A PostgreSQL extension for storing point cloud (LIDAR) data."
HOMEPAGE="https://github.com/pgpointcloud/pointcloud"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pgpointcloud/pointcloud.git"

SLOT="0"
LICENSE="BSD-3"
KEYWORDS=""

RDEPEND=""
DEPEND=">=dev-db/postgresql-10
	>=dev-libs/libght-9999
	>=sci-geosciences/laz_perf-9999
	>=dev-util/cunit-2.1
	>=dev-libs/libxml2-2.9.4"

REQUIRED_USE=""

src_prepare() {
	default
	eautoreconf

	postgres-multi_src_prepare
}

src_configure() {
	local myeconfargs=(
		--with-lazperf=/usr/include/laz-perf
	)
#	default

	postgres-multi_foreach econf "${myeconfargs[@]}"
}

src_compile() {
        postgres-multi_foreach emake
}

src_install() {
        postgres-multi_foreach emake DESTDIR="${D}" install
}
