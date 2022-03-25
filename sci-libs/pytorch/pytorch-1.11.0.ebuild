# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_SETUPTOOLS=manual
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 toolchain-funcs python-single-r1 git-r3

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="https://github.com/pytorch/pytorch"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
EGIT_BRANCH="release/1.11"
EGIT_SUBMODULES=( '*' )


LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="+cuda +python" # for torchvision

DEPEND="dev-python/future\
	dev-python/typing-extensions\
	dev-python/six\
	dev-python/setuptools\
	dev-python/pyyaml\
	dev-python/numpy\
	dev-python/requests\
	dev-cpp/gflags
	dev-cpp/glog"
RDEPEND="${DEPEND}"

src_prepare() {
#	NCCL_INCLUDE_DIRS="/usr/include"
#	NCCL_LIBRARIES="/usr/lib64"
#	CUDA_GPU_DETECT_OUTPUT=7.5
#	NCCL_EXTERNAL=TRUE
#	USE_SYSTEM_NCCL=1
#	USE_GFLAGS=ON
#	USE_GLOG=ON
#	eapply "${FILESDIR}/fix_autodetection.patch"
#	eapply "${FILESDIR}/fix_sleef_include_for_aten.patch"
	eapply_user
	sed -i 's#^  ${CMAKE_CURRENT_SOURCE_DIR}/tensor_iterator_test.cpp##g' aten/src/ATen/test/CMakeLists.txt
}
