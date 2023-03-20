# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

#WANT_AUTOCONF="2.5"

#GENTOO_DEPEND_ON_PERL="no"
#PYTHON_COMPAT=( python3_6 )
#DISTUTILS_OPTIONAL=1

inherit cmake git-r3 eutils

DESCRIPTION="Translator library for raster geospatial data formats (includes OGR support)"
HOMEPAGE="https://www.github.com/pirl-lpl/pirlpluplus"
#SRC_URI="https://github.com/PDAL/PDAL/releases/download/1.9.1/PDAL-1.9.1-src.tar.gz"
EGIT_REPO_URI="https://github.com/pirl-lpl/pirlplusplus.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~arm ~arm64 ~ia64 ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
#IUSE="armadillo +aux_xml curl debug doc fits geos gif gml hdf5 java jpeg jpeg2k mdb mysql netcdf odbc ogdi opencl oracle pdf perl png postgres python spatialite sqlite threads xls"
#IUSE="python"

#S="${WORKDIR}/{P}"

#DEPEND="sci-geosciences/laszip"

#src_configure() {
#        if use python; then
#                mycmakeargs+=( -DBUILD_PLUGIN_PYTHON:BOOL=ON )
#        fi
#
#	cmake-utils_src_configure
#}

src_prepare() {
	eapply ${FILESDIR}/cmake.patch

	cmake_src_prepare
}