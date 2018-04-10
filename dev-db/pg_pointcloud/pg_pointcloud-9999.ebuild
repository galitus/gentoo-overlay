# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

#AUTOTOOLS_AUTORECONF=yes

#inherit autotools-utils multilib
inherit cmake-utils git-r3

DESCRIPTION="A PostgreSQL extension for storing point cloud (LIDAR) data."
HOMEPAGE="https://github.com/pgpointcloud/pointcloud"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pgpointcloud/pointcloud.git"


#LICENSE="GPL-2 gmttria? ( Artistic )"
SLOT="0"
LICENSE="BSD-3"
KEYWORDS=""
#IUSE="static-libs"

RDEPEND=""
DEPEND=">=dev-db/postgresql-9.5.7
	>=dev-libs/libght-9999
	>=sci-geosciences/laz_perf-9999
	>=dev-util/cmake-3.7.2
	>=dev-util/cunit-2.1
	>=dev-libs/libxml2-2.9.4"

REQUIRED_USE=""

# hand written make files that are not parallel safe
#MAKEOPTS+=" -j1"

#PATCHES=(
#	"${FILESDIR}"/${PN}-4.5.9-no-strip.patch
#	"${FILESDIR}"/${PN}-4.5.6-respect-ldflags.patch
#	"${FILESDIR}"/${PN}-4.5.9-unistd.h.patch
#	)

#AUTOTOOLS_IN_SOURCE_BUILD=1

#src_prepare() {
#	mv -f "${WORKDIR}/share/"* "${S}/share/" || die
#
#	tc-export AR RANLIB
#
#	autotools-utils_src_prepare
#
#	eautoreconf
#}

#src_configure() {
#	local myeconfargs=(
#		--libdir=/usr/$(get_libdir)/${P}
#		--includedir=/usr/include/${P}
#		--datadir=/usr/share/${P}
#		--docdir=/usr/share/doc/${PF}
#		--disable-update
#		--disable-matlab
#		--disable-xgrid
#		--disable-debug
#		$(use_enable gdal)
#		$(use_enable netcdf)
#		$(use_enable octave)
#		$(use_enable debug devdebug)
#		$(use_enable !metric US)
#		$(use_enable postscript eps)
#		$(use_enable mex)
#		$(use_enable gmttria triangle)
#		)
#	autotools-utils_src_configure
#}

#src_configure() {
#        local mycmakeargs=(
#		-DGMT_OPENMP=ON
#        )
#
#        cmake-utils_src_configure
#}

#src_install() {
#	autotools-utils_src_install install-all

	# remove static libs
#	find "${ED}/usr/$(get_libdir)" -name '*.a' -exec rm -f {} +

#	cat <<- _EOF_ > "${T}/99gmt"
#	GMTHOME="${EPREFIX}/usr/share/${P}"
#	GMT_SHAREDIR="${EPREFIX}/usr/share/${P}"
#	_EOF_
#	doenvd "${T}/99gmt"
#
#}