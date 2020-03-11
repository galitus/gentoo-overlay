# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CUDA_PV=10.1

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

MY_PV_MAJOR=$(ver_cut 1-2)
SRC_URI="nccl_${PV}-1+cuda${CUDA_PV}_x86_64.txz"

SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
RESTRICT="fetch"
LICENSE="NVIDIA"
QA_PREBUILT="*"

S="${WORKDIR}/nccl_${PV}-1+cuda${CUDA_PV}_x86_64"

DEPEND="=dev-util/nvidia-cuda-toolkit-${CUDA_PV}*"
RDEPEND="${DEPEND}"

src_install() {
#	insinto /opt/cuda/targets/x86_64-linux/include
	doheader -r include/*
#	doins -r cuda/include/*

	#insinto /opt/cuda/targets/x86_64-linux/lib
	#doins -r cuda/lib*/*
	dolib.so lib/libnccl.so.2.5.6 lib/libnccl.so.2 lib/libnccl.so
	dolib.a lib/libnccl_static.a

	insinto /usr/lib64/pkgconfig/
	doins lib/pkgconfig/*
}
