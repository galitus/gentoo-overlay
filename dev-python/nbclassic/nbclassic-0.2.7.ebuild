# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DISTUTILS_USE_SETUPTOOLS=bdepend

DESCRIPTION="Jupyter Notebook as a Jupyter Server Extension"
HOMEPAGE="https://github.com/jupyterlab/nbclassic"
SRC_URI="https://github.com/jupyterlab/nbclassic/archive/${PV}.tar.gz -> nbclassic-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#RESTRICT=network-sandbox

DEPEND=""

RDEPEND="${DEPEND}"
