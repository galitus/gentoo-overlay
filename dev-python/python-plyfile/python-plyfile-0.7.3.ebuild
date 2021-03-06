# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Welcome to the plyfile Python module, which provides a simple facility for reading and writing ASCII and binary PLY files."
HOMEPAGE="https://github.com/dranjan/python-plyfile"
SRC_URI="https://github.com/dranjan/python-plyfile/archive/v${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
