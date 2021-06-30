# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 python3_10 )

inherit distutils-r1

DESCRIPTION="Simple escaping of text, given a set of safe characters and an escape character."
HOMEPAGE="https://github.com/minrk/escapism"
SRC_URI="https://github.com/minrk/escapism/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

#RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
"
