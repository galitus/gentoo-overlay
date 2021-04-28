# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Jupyter Kernel for Postgresql"
HOMEPAGE="https://github.com/bgschiller/postgres_kernel"
SRC_URI="https://files.pythonhosted.org/packages/e0/3b/e995a6fa2a1e643f465576e61ef6a81c62644bc81655b7c82c73071764b7/postgres_kernel-0.2.2.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/metakernel"
RDEPEND="${DEPEND}"

src_install(){
	python_setup
	distutils-r1_python_install
}
