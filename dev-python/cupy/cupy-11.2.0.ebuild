# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="NumPy-like API accelerated with CUDA"
HOMEPAGE="https://github.com/cupy/cupy/"
SRC_URI="https://github.com/cupy/cupy/archive/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/NVIDIA/cub/archive/c3cceac115c072fb63df1836ff46d8c60d9eb304.zip -> cub-c3cceac115c072fb63df1836ff46d8c60d9eb304.zip
https://github.com/NVIDIA/jitify/archive/4a37de0be4639f222c6565ebd0654cb922b5180e.zip -> jitify-4a37de0be4639f222c6565ebd0654cb922b5180e.zip"
#https://github.com/NVIDIA/jitify/archive/60e9e7231fe7529ecfc76fa97b9c02b3033f4157.zip -> jitify-60e9e7231fe7529ecfc76fa97b9c02b3033f4157.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	>=dev-python/fastrlock-0.5
	>=dev-python/optuna-2.0
	>=dev-python/scipy-1.4
"

RDEPEND="${DEPEND}"

src_prepare() {
        rmdir cupy/_core/include/cupy/cub || die
        ln -sv "${WORKDIR}"/cub-c3cceac115c072fb63df1836ff46d8c60d9eb304 cupy/_core/include/cupy/cub || die
        rmdir cupy/_core/include/cupy/jitify || die
        ln -sv "${WORKDIR}"/jitify-4a37de0be4639f222c6565ebd0654cb922b5180e cupy/_core/include/cupy/jitify || die

	default
}
