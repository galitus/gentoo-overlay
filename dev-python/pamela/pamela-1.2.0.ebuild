# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 toolchain-funcs git-r3

DESCRIPTION="Pamela: yet another Python wrapper for PAM"
HOMEPAGE="https://github.com/minrk/pamela"
#SRC_URI="https://github.com/minrk/pamela/archive/refs/tags/${PV}.tar.gz -> pamela-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/minrk/${PN}"
EGIT_COMMIT="8b55885855c57ed510d2c45143864fcfac5840b3"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
