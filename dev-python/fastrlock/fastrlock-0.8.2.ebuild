# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="A fast RLock implementation for CPython"
HOMEPAGE="https://github.com/scoder/fastrlock/"
SRC_URI="https://github.com/scoder/fastrlock/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
