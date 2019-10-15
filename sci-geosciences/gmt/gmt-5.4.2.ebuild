# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#AUTOTOOLS_AUTORECONF=yes

#inherit autotools-utils multilib
inherit cmake-utils

#GSHHS="gshhs-2.2.0"

DESCRIPTION="Powerful map generator"
HOMEPAGE="http://gmt.soest.hawaii.edu/"
SRC_URI="ftp://ftp.iris.washington.edu/pub/gmt/legacy/${P}-src.tar.gz"
#	gmttria? ( mirror://gmt/legacy/${P}-non-gpl.tar.bz2 )"

#LICENSE="GPL-2 gmttria? ( Artistic )"
LICENSE="GPL-2 ( Artistic )"
SLOT="0"
KEYWORDS="amd64"
#IUSE="debug +gdal gmttria +metric mex +netcdf octave postscript"
IUSE="debug +gdal +gshhg +metric mex +netcdf octave postscript"

RDEPEND="
	!sci-biology/probcons
	gdal? ( sci-libs/gdal )
	gshhg? ( sci-geosciences/gshhg-gmt )
	netcdf? ( >=sci-libs/netcdf-4.1 )
	octave? ( sci-mathematics/octave )"
DEPEND="${RDEPEND}"

#S="${WORKDIR}/GMT${PV}"

# mex can use matlab too which i can't test
REQUIRED_USE="
	mex? ( octave )
"

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

src_configure() {
        local mycmakeargs=(
		-DGMT_OPENMP=ON \
		-DGMT_DATADIR=share/${P}
#		-DCMAKE_INSTALL_DATADIR:PATH=/usr/share/${P}
#                --libdir=/usr/$(get_libdir)/${P} \
#                --includedir=/usr/include/${P} \
#                --datadir=/usr/share/${P} \
#                --docdir=/usr/share/doc/${PF} \
        )

        cmake-utils_src_configure
}

src_install() {
#	autotools-utils_src_install install-all

	cmake-utils_src_install
	# remove static libs
#	find "${ED}/usr/$(get_libdir)" -name '*.a' -exec rm -f {} +

	cat <<- _EOF_ > "${T}/99gmt"
	GMTHOME="${EPREFIX}/usr/share/${P}"
	GMT_SHAREDIR="${EPREFIX}/usr/share/${P}"
	_EOF_
	doenvd "${T}/99gmt"

        if use gshhg; then
		dosym /usr/share/gshhg /usr/share/gmt-5.4.2/coast
        fi

#
}
