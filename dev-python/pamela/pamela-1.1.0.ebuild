# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Pamela: yet another Python wrapper for PAM"
HOMEPAGE="https://github.com/minrk/pamela"
SRC_URI="https://github.com/minrk/pamela/archive/refs/tags/${PV}.tar.gz -> pamela-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
