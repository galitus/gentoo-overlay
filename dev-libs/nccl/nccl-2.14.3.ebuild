# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#CUDA_PV=11.1

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

MY_PV_MAJOR=$(ver_cut 1-2)
SRC_URI="https://github.com/NVIDIA/nccl/archive/refs/tags/v${PV}-1.tar.gz -> ${P}-1.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
LICENSE="NVIDIA"
QA_PREBUILT="*"

#S="${WORKDIR}/nccl_${PV}-1+cuda${CUDA_PV}_x86_64"
S="${S}-1"

DEPEND="=dev-util/nvidia-cuda-toolkit-11*"
RDEPEND="${DEPEND}"

src_compile() {
	make -j src.build CUDA_HOME=/opt/cuda
}

src_install() {
#	insinto /opt/cuda/targets/x86_64-linux/include
	doheader -r src/include/*
#	doins -r cuda/include/*

	#insinto /opt/cuda/targets/x86_64-linux/lib
	#doins -r cuda/lib*/*
	dolib.so build/lib/libnccl.so.${PV} build/lib/libnccl.so.2 build/lib/libnccl.so
	dolib.a build/lib/libnccl_static.a

	insinto /usr/lib64/pkgconfig/
	doins build/lib/pkgconfig/*
}
