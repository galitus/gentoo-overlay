# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 git-r3

DESCRIPTION="Simple escaping of text, given a set of safe characters and an escape character."
HOMEPAGE="https://github.com/minrk/escapism"
#SRC_URI="https://github.com/minrk/escapism/archive/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/minrk/${PN}"
EGIT_COMMIT="cc98a1b922043a328a15c76da138a664cd455fd2"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

#RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
"
