# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Jupyter Kernel for Matlab "
HOMEPAGE="https://github.com/calysto/matlab_kernel"
SRC_URI="https://github.com/Calysto/matlab_kernel/archive/${PV}.tar.gz -> matlab_kernel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/metakernel"
RDEPEND="${DEPEND}"

S="${WORKDIR}/matlab_kernel-${PV}"

src_install(){
	python_setup
	distutils-r1_python_install
}
