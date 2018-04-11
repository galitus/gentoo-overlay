# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="ISIS3 - Integrated Software for Imagers and Spectrometers ISIS3 public release site"
HOMEPAGE="https://github.com/USGS-Astrogeology/isis3_cmake"
SRC_URI=""
EGIT_REPO_URI="https://github.com/USGS-Astrogeology/isis3_cmake.git"


LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/boost-1.65[context]
        >=dev-cpp/eigen-3.2.8-r2
        >=sci-libs/cspice-66
        >=sci-libs/fspice-66
        >=sci-libs/nn-1.86.2
        >=sci-libs/flann-1.9.1
	>=sci-libs/embree-2.17.4
	>=sci-libs/cholmod-2.1.2[lapack]
	>=sci-libs/ccolamd-2.8.0
	>=sci-libs/camd-2.3.1
	>=sci-libs/jama-1.2.5
	>=sci-libs/gsl-2.4
	>=sci-libs/libgeotiff-1.4.0
	>=sci-mathematics/gmm-5.1
	>=sci-libs/hdf5-1.8.18
	>=sci-libs/pcl-1.8.1
	>=dev-libs/protobuf-3.5.1.1
	>=sci-libs/amd-2.3.1[fortran]
	>=sci-physics/bullet-2.86[bullet3]
	>=media-libs/opencv-3.3.0-r5[jpeg2k,xine,gphoto2,gstreamer,ffmpeg,gdal,lapack,webp,gtk,contrib_xfeatures2d,contrib,cuda]
	>=sci-libs/suitesparseconfig-4.2.1-r1
	>=sci-libs/lapack-reference-3.2.1-r4
	>=sci-libs/blas-reference-20070226-r4
	>=x11-libs/qwt-6.1.3-r1[qt5]
	>=sci-libs/hdf5-1.8.18[-threads]
	>=media-libs/tiff-4.0.9-r3
	>=sci-libs/superlu-4.3-r1
	>=sci-libs/tnt-3.0.12
	>=dev-libs/xerces-c-3.1.4-r1
	>=sci-libs/geos-3.5.0-r2
	>=media-libs/libpng-1.6.29
	"

RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
#S=${WORKDIR}/toolkit
CMAKE_USE_DIR="${S}/isis"

#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

src_configure() {
	epatch "${FILESDIR}"/*.patch
        local mycmakeargs=(
                -DJP2KFLAG=OFF
		-DCMAKE_INSTALL_PREFIX=/opt/isis3/
        )

        cmake-utils_src_configure
}

src_install() {
        cmake-utils_src_install

	insinto /etc/env.d/
	insopts -m 0644 -o root -g root
	doins "${FILESDIR}"/91isis.env
#        insinto /opt/isis3/
#        insopts -m 0755 -o root -g root
#        doins -r ${D}/opt/isis3/*
#        insinto /
#        insopts -m 0755 -o root -g root
#        doins -r ${D}/usr
}
