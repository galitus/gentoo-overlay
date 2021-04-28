# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="A Python implementation of the JSON5 data format."
HOMEPAGE="https://github.com/dpranke/pyjson5"
SRC_URI="https://github.com/dpranke/pyjson5/archive/v${PV}.tar.gz -> pyjson5-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
