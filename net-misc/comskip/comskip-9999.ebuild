# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils git-r3

DESCRIPTION="Commercial detector"
HOMEPAGE="https://github.com/erikkaashoek/Comskip"
SRC_URI=""
EGIT_REPO_URI="https://github.com/erikkaashoek/Comskip"

#S=${WORKDIR}

SLOT="0"
LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
IUSE="static-libs"

RDEPEND=""
DEPEND="dev-libs/argtable \
	media-video/ffmpeg \
	${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-gui
}

src_install() {
	default
	insinto /etc/comskip
	doins "${FILESDIR}"/comskip.ini
}
