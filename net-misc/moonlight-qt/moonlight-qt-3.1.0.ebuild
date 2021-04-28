# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/moonlight-stream/moonlight-qt.git"
EGIT_COMMIT="v${PV}"

KEYWORDS="~amd64"

inherit git-r3 qmake-utils xdg-utils

DESCRIPTION="Moonlight PC is an open source implementation of NVIDIA's GameStream"
HOMEPAGE="https://github.com/moonlight-stream/moonlight-qt"

LICENSE="GPL-3"
SLOT="0"
IUSE="haptic"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols2
	dev-qt/qtsvg
	media-libs/libsdl2[haptic?]
	media-libs/opus
	media-libs/sdl2-ttf
"
BDEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="${EPREFIX}/usr" ${PN}.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install

	# avoid collisions with other moonlight clients, e.g., moonlight-embedded
	mv "${ED}/usr/bin/moonlight" "${ED}/usr/bin/moonlight-qt"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
