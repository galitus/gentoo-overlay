# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VCG_VERSION="2025.07"
CORTO_VER="2025.07"
NEXUS_VER="2025.05"
LIBIGL_VER="2.4.0"
LIB3MF_VERSION="2.4.1"
LIBE57_VER="3.1.1"
LEVMAR_VERSION="2.6.1"

inherit cmake xdg

CMAKE_BUILD_TYPE=Release

DESCRIPTION="System for processing and editing unstructured 3D triangular meshes"
HOMEPAGE="https://www.meshlab.net/"
SRC_URI="https://github.com/cnr-isti-vclab/meshlab/archive/refs/tags/MeshLab-${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/cnr-isti-vclab/vcglib/archive/refs/tags/${VCG_VERSION}.tar.gz -> vcglib-${VCG_VERSION}.tar.gz
	https://www.meshlab.net/data/libs/easyexif-1.0.zip
	https://www.meshlab.net/data/libs/levmar-${LEVMAR_VERSION}.zip
	https://www.meshlab.net/data/libs/libE57Format-${LIBE57_VER}.zip
	https://www.meshlab.net/data/libs/lib3mf-${LIB3MF_VERSION}-source-with-submodules.zip
	https://www.meshlab.net/data/libs/libigl-${LIBIGL_VER}.zip
	https://www.meshlab.net/data/libs/nexus-${NEXUS_VER}.zip
	https://www.meshlab.net/data/libs/corto-${CORTO_VER}.zip
	https://www.meshlab.net/data/libs/StructureSynth-1.5.1.zip
	https://www.meshlab.net/data/libs/tinygltf-2.6.3.zip
	https://www.meshlab.net/data/libs/u3d-1.5.1.zip
"
S="${WORKDIR}/meshlab-MeshLab-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="double-precision minimal"

# qhull: newer meshlab supports system re-entrant version
# levmar: build system hardcodes vendored copy
DEPEND="
	dev-cpp/eigen:3
	dev-cpp/muParser
	dev-libs/gmp:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtdeclarative:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-libs/embree:4
	media-libs/glew:0=
	=media-libs/lib3ds-1*
	media-libs/openctm:=
	media-libs/glew:0
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-disable-updates.patch"
#	"${FILESDIR}/${P}-find-plugins.patch"
)

src_unpack() {
	unpack ${P}.tar.gz
	cd "${S}" || die
	unpack vcglib-${VCG_VERSION}.tar.gz
	mv vcglib-${VCG_VERSION}/* src/vcglib || die

	unpack easyexif-1.0.zip
	mv easyexif-1.0/* src/external/easyexif-1.0/ || die

	mkdir levmar-2.6.1
	cd levmar-2.6.1 || die
	unpack levmar-2.6.1.zip
	cd .. || die
	mv levmar-2.6.1	src/external/downloads/ || die

	unpack libE57Format-3.1.1.zip
	mv libE57Format-3.1.1 src/external/downloads/ || die

	mkdir lib3mf-2.4.1
	cd lib3mf-2.4.1 || die
	unpack lib3mf-2.4.1-source-with-submodules.zip
	cd .. || die
	mv lib3mf-2.4.1 src/external/downloads/ || die

	unpack libigl-2.4.0.zip
	mv libigl-2.4.0 src/external/downloads/ || die

	unpack nexus-2025.05.zip
	mv nexus-2025.05 src/external/downloads/ || die

	unpack corto-2025.07.zip
	mv corto-2025.07 src/external/downloads/nexus-2025.05/src/corto || die

	unpack StructureSynth-1.5.1.zip
	mv StructureSynth-1.5.1 src/external/downloads/ || die

	unpack tinygltf-2.6.3.zip
	mv tinygltf-2.6.3 src/external/downloads/ || die

	unpack u3d-1.5.1.zip
	mv u3d-1.5.1 src/external/downloads/ || die

}

src_configure() {
	local mycmakeargs=(
		-DBUILD_MINI=$(usex minimal)
		-DBUILD_WITH_DOUBLE_SCALAR=$(usex double-precision)
                -DMESHLAB_ALLOW_DOWNLOAD_DLL_EMBREE:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_BOOST:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_CGAL:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_EMBREE:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_LEVMAR:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_LIB3DS:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_LIB3MF:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_LIBE57:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_LIBIGL:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_MUPARSER:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_NEXUS:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_OPENCTM:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_QHULL:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_STRUCTURE_SYNTH:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_TINYGLTF:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_U3D:BOOL=OFF
                -DMESHLAB_ALLOW_DOWNLOAD_SOURCE_XERCES:BOOL=OFF
		-DMESHLAB_ALLOW_SYSTEM_EMBREE:BOOL=ON
		-DMESHLAB_ALLOW_SYSTEM_GLEW:BOOL=ON
	)
	cmake_src_configure
}
