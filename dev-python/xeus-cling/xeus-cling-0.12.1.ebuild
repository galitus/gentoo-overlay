# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit toolchain-funcs cmake

DESCRIPTION="Jupyter kernel for the C++ programming language"
HOMEPAGE="https://github.com/QuantStack/xeus-cling/"
SRC_URI="https://github.com/QuantStack/xeus-cling/archive/${PV}.tar.gz -> xeus-cling-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=net-libs/cppzmq-4.3.0
	dev-python/xtl
	dev-libs/pugixml
	dev-cpp/cxxopts
	>=dev-python/xeus-1.0.0"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
	cmake_src_prepare
}
