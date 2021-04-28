# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit toolchain-funcs cmake

DESCRIPTION="QuantStack - The x template library"
HOMEPAGE="https://github.com/QuantStack/xtl/"
SRC_URI="https://github.com/QuantStack/xtl/archive/${PV}.tar.gz -> xtl-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_prepare(){
	eapply_user
	cmake_src_prepare
}
