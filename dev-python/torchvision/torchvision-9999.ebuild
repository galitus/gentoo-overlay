# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs git-r3

DESCRIPTION="Datasets, Transforms and Models specific to Computer Vision"
HOMEPAGE="https://github.com/pytorch/vision"
#SRC_URI="https://github.com/pytorch/vision/archive/v${PV}.tar.gz -> torchvision-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/pytorch/vision/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/pytorch"
RDEPEND="${DEPEND}"

S="${WORKDIR}/torchvision-${PV}"

src_prepare(){
	eapply_user
	export CUDA_HOME=/opt/cuda
	export WITH_CUDA=true
	cp "${FILESDIR}"/setup.py "${S}"/
	distutils-r1_python_prepare_all
}
