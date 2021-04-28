# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-r1
#git-r3

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="https://github.com/pytorch/pytorch"
SRC_URI="https://github.com/pytorch/pytorch/archive/refs/tags/v${PV}.tar.gz -> pytorch-${PV}.tar.gz"
#SRC_URI="https://github.com/pytorch/pytorch/archive/v1.3.1.tar.gz -> pytorch-1.3.1.tar.gz"
#EGIT_REPO_URI="https://github.com/pytorch/pytorch"
#EGIT_BRANCH="v1.3.1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/future\
	dev-python/typing\
	dev-python/six\
	dev-python/setuptools\
	dev-python/pyyaml\
	dev-python/numpy\
	dev-python/requests\
	dev-libs/nccl
	dev-cpp/gflags
	dev-cpp/glog"
RDEPEND="${DEPEND}"

src_prepare() {
	NCCL_INCLUDE_DIRS="/usr/include"
	NCCL_LIBRARIES="/usr/lib64"
#	CUDA_GPU_DETECT_OUTPUT=7.5
	NCCL_EXTERNAL=TRUE
	USE_SYSTEM_NCCL=1
	USE_GFLAGS=ON
	USE_GLOG=ON
#	eapply "${FILESDIR}/fix_autodetection.patch"
#	eapply "${FILESDIR}/fix_sleef_include_for_aten.patch"
	eapply_user
	sed -i 's#^  ${CMAKE_CURRENT_SOURCE_DIR}/tensor_iterator_test.cpp##g' aten/src/ATen/test/CMakeLists.txt
}
