# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="XRDP driver for xorg"
HOMEPAGE="https://github.com/neutrinolabs/xorgxrdp"
SRC_URI=""
EGIT_REPO_URI="https://github.com/neutrinolabs/xorgxrdp"

#S=${WORKDIR}/${P}/xorgxrdp

SLOT="0"
LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
IUSE="static-libs"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}
