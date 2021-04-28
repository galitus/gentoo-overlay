# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Cartopy - a cartographic python library with matplotlib support"
HOMEPAGE="https://github.com/SciTools/cartopy"
SRC_URI="https://github.com/SciTools/cartopy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
