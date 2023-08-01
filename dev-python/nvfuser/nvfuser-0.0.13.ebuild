# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 pypi

DESCRIPTION=" A Fusion Code Generator for NVIDIA GPUs (commonly known as "nvFuser")"
HOMEPAGE="https://github.com/NVIDIA/Fuser"
SRC_URI="https://github.com/NVIDIA/Fuser/archive/refs/tags/v${PV}.tar.gz"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
RESTRICT=""

RDEPEND="
	dev-cpp/benchmark
	dev-libs/flatbuffers
	dev-python/pybind11
	dev-util/ninja
	sci-libs/gloo
	dev-cpp/gtest
	"

DEPEND="${RDEPEND}"
