# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
#PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit toolchain-funcs cmake

DESCRIPTION="Lightweight C++ command line option parser"
HOMEPAGE="https://github.com/jarro2783/cxxopts"
SRC_URI="https://github.com/jarro2783/cxxopts/archive/v${PV}.tar.gz -> cxxopts-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_prepare(){
	eapply_user
	cmake_src_prepare
}
