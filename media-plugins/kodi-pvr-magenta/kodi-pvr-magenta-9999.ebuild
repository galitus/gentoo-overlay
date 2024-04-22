# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake kodi-addon

DESCRIPTION="Magenta PVR client for Kodi"
HOMEPAGE="https://github.com/nirvana-7777/pvr.magenta"
SRC_URI=""

case ${PV} in
9999)
	KEYWORDS="amd64 x86"
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/nirvana-7777/pvr.magenta"
	EGIT_BRANCH="Omega"
	inherit git-r3
	;;
*)
	KEYWORDS="~amd64 ~x86"
	CODENAME="Omega"
	SRC_URI="https://github.com/peak3d/inputstream.adaptive/archive/${PV}-${CODENAME}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/inputstream.adaptive-${PV}-${CODENAME}"
	;;
esac

LICENSE="GPL-2"
SLOT="0"
RESTRICT=""
IUSE=""

PATCHES=(
	"${FILESDIR}/dynamic_tinyxml2.patch"
)

COMMON_DEPEND="
	=media-tv/kodi-21*
	media-plugins/kodi-inputstream-adaptive
	"
DEPEND="
	${COMMON_DEPEND}
	"
RDEPEND="
	${COMMON_DEPEND}
	"

#src_prepare() {
#	[ -d depends ] && rm -rf depends || die
#	cmake_src_prepare
#}

#src_configure() {
#	cmake_src_configure
#}
