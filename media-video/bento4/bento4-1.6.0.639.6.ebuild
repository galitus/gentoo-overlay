# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit cmake

CODENAME="Nexus"
DESCRIPTION="Full-featured MP4 format, MPEG DASH, HLS, CMAF SDK and tools"
HOMEPAGE="https://github.com/xbmc/Bento4/"
SRC_URI="https://github.com/xbmc/Bento4/archive/refs/tags/1.6.0-639-6-${CODENAME}.tar.gz"

SLOT="0"
LICENSE="Bento4 GPL"
KEYWORDS="~amd64"

S="${WORKDIR}/Bento4-1.6.0-639-6-Nexus"

DEPEND=""
PATCHES="${FILESDIR}/up2date.patch"

src_configure() {
        local mycmakeargs=(
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON
        )

        cmake_src_configure
}
