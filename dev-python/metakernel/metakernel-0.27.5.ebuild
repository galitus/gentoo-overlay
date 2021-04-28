# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="A Jupyter kernel base class in Python which includes core magic functions (including help, command and file path completion, parallel and distributed processing, downloads, and much more)."
HOMEPAGE="https://github.com/Calysto/metakernel"
SRC_URI="https://github.com/Calysto/metakernel/archive/${PV}.tar.gz -> metakernel-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_install(){
	python_setup
	distutils-r1_python_install
}
