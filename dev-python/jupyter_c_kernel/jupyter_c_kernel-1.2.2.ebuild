# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Minimal C kernel for Jupyter"
HOMEPAGE="https://github.com/brendan-rius/jupyter-c-kernel"
SRC_URI="https://github.com/brendan-rius/jupyter-c-kernel/archive/${PV}.tar.gz -> jupyter_c_kernel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}/jupyter-c-kernel-${PV}"

src_install(){
	python_setup
	insinto /usr/share/jupyter/kernels/c/
	doins "${FILESDIR}"/kernel.json
}
