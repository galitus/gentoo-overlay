# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	_ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/${PN^^}/${PN^^}.git"
	S="${WORKDIR}"/${P}
else
	_ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/fatiando/${PN}.git"
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64"
fi

DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517=setuptools

inherit fortran-2 flag-o-matic toolchain-funcs ${_ECLASS} distutils-r1 python-utils-r1 python-r1

DESCRIPTION="Reference ellipsoids for geodesy and geophysics"
HOMEPAGE="https://github.com/fatiando/boule"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="static-libs"
RESTRICT="test"

RDEPEND="
	>=dev-python/scipy-1.8.0
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.3.0
	${PYTHON_DEPS}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"
