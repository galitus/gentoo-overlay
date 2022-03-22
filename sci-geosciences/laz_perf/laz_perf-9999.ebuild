# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#AUTOTOOLS_AUTORECONF=yes

#inherit autotools-utils multilib
inherit cmake git-r3

DESCRIPTION="Alternative LAZ implementation for C++ and JavaScript "
HOMEPAGE="https://github.com/hobu/laz-perf"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hobu/laz-perf.git"

SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS=""

RDEPEND=""
DEPEND=">=dev-util/cmake-3.7.2
	>=dev-util/cunit-2.1"

REQUIRED_USE=""

src_install() {
	cmake_src_install
	mv ${D}/usr/lib ${D}/usr/lib64
}
