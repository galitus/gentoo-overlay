# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

#WANT_AUTOCONF="2.5"

#GENTOO_DEPEND_ON_PERL="no"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )
#DISTUTILS_OPTIONAL=1

inherit cmake

DESCRIPTION="Translator library for raster geospatial data formats (includes OGR support)"
HOMEPAGE="https://pdal.io"
SRC_URI="https://github.com/PDAL/PDAL/releases/download/${PV}/PDAL-${PV}-src.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~arm ~arm64 ~ia64 ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos"
#IUSE="armadillo +aux_xml curl debug doc fits geos gif gml hdf5 java jpeg jpeg2k mdb mysql netcdf odbc ogdi opencl oracle pdf perl png postgres python spatialite sqlite threads xls"
IUSE="python"

S="${WORKDIR}/PDAL-${PV}-src"

DEPEND="sci-geosciences/laszip
	sci-libs/gdal"

src_prepare() {
	eapply "${FILESDIR}/cmake-libdir-fix.patch"
	eapply_user

	cmake_src_prepare
}

src_configure() {
	if use python; then
		mycmakeargs+=( -DBUILD_PLUGIN_PYTHON:BOOL=ON )
	fi

	cmake_src_configure
}
