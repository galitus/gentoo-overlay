# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake kodi-addon

DESCRIPTION="Libretro compatibility layer for the Kodi Game API"
HOMEPAGE="https://github.com/kodi-game/game.libretro"
SRC_URI=""

case ${PV} in
9999)
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/kodi-game/game.libretro.git"
	inherit git-r3
	;;
*)
	KEYWORDS="~amd64 ~x86"
	CODENAME="Omega"
	SRC_URI="https://github.com/kodi-game/game.libretro/archive/refs/tags/${PV}-${CODENAME}.tar.gz -> ${P}.tar.gz
		https://github.com/libretro/libretro-common/archive/50c15a88eb741cbe675743a282d8cc4c89421e3f.tar.gz -> libretro-common-50c15a88eb741cbe675743a282d8cc4c89421e3f.tar.gz
		https://github.com/RetroAchievements/rcheevos/archive/v9.2.0.tar.gz -> rcheevos-v9.2.0.tar.gz"
	S="${WORKDIR}/game.libretro-${PV}-${CODENAME}"
	;;
esac

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	=media-tv/kodi-21*
	"
RDEPEND="
	${DEPEND}
	"



src_prepare() {
#	sed -i s/"https:\/\/github.com\/RetroAchievements\/rcheevos\/archive\/v9.2.0.tar.gz"/"$\{PORTAGE_BUILDDIR\}\/distdir\/rcheevos-9.2.0.tar.gz"/g ${S}/depends/common/rcheevos/rcheevos.txt
	#mv ${WORKDIR}/rcheevos-9.2.0 ${WORKDIR}/rcheevos
	mkdir ${WORKDIR}/rcheevos-9.2.0/build
	cp ${S}/depends/common/rcheevos/CMakeLists.txt ${WORKDIR}/rcheevos-9.2.0/
	pushd ${WORKDIR}/rcheevos-9.2.0/build
	cmake ..
	emake
	popd
	mkdir ${WORKDIR}/rcheevos
	cp -R ${WORKDIR}/rcheevos-9.2.0/include/* ${WORKDIR}/rcheevos/


	#mv ${WORKDIR}/libretro-common-50c15a88eb741cbe675743a282d8cc4c89421e3f/ ${WORKDIR}/libretro-common/
	mkdir ${WORKDIR}/libretro-common/
	cp -R ${WORKDIR}/libretro-common-50c15a88eb741cbe675743a282d8cc4c89421e3f/include/* ${WORKDIR}/libretro-common/

	cmake_src_prepare
}

src_configure() {
        local mycmakeargs=(
		-DLIBRETRO_COMMON_INCLUDE_DIR="${WORKDIR}/"
		-DRCHEEVOS_INCLUDE_DIR="${WORKDIR}/"
		-DRCHEEVOS_LIBRARY="${WORKDIR}/rcheevos-9.2.0/build"
#		-DENABLE_INTERNAL_RCHEEVOS=ON
        )

	cmake_src_configure
}
