# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit cmake git-r3 autotools

DESCRIPTION="Translator library for raster geospatial data formats (includes OGR support)"
HOMEPAGE="https://www.github.com/pirl-lpl/pirlpluplus"
EGIT_REPO_URI="https://github.com/pirl-lpl/pirlplusplus.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~arm ~arm64 ~ia64 ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"

src_prepare() {
	eapply ${FILESDIR}/cmake.patch

	cmake_src_prepare
}
