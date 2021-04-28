# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit toolchain-funcs cmake

DESCRIPTION="C++ implementation of the Jupyter kernel protocol"
HOMEPAGE="https://github.com/QuantStack/xeus/"
SRC_URI="https://github.com/QuantStack/xeus/archive/${PV}.tar.gz -> xeus-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-cpp/nlohmann_json-3.2.0
	>=dev-python/xtl-0.7
	>=net-libs/cppzmq-4.4.1
	>=net-libs/zeromq-4.3.2
	dev-cpp/cxxopts"
RDEPEND="${DEPEND}"

src_prepare(){
	eapply_user
	cmake_src_prepare
}
