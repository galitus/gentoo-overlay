# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs cmake-utils

DESCRIPTION="Header-only C++ binding for libzmq"
HOMEPAGE="https://github.com/zeromq/cppzmq"
SRC_URI="https://github.com/zeromq/cppzmq/archive/v4.3.0.tar.gz -> cppzmq-4.3.0.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=net-libs/zeromq-3"
DEPEND=""
#DEPEND="dev-cpp/catch"

src_prepare() {
	epatch_user
	eapply ${FILESDIR}/cppzmq_cmake_google.patch
	cmake-utils_src_prepare
}

src_configure() {
        local mycmakeargs=(
                -DBUILD_SHARED:BOOL=ON
        )

        cmake-utils_src_configure
}

src_compile() {
	:;
}

src_install() {
	doheader zmq.hpp
#	dodoc README
}

src_test() {
	$(tc-getCC) -c ./zmq.hpp -L ./.libs/ -I ./include/ -o ./test.o || die "This version of cppzmq is not compatible with the installed version of net-libs/zeromq"
	rm -f ./test.o
}
