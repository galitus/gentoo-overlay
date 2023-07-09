# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 pypi

DESCRIPTION="The bidirectional mapping library for Python."
HOMEPAGE="https://pypi.org/project/bidict/ https://github.com/jab/bidict"
SRC_URI="$(pypi_sdist_url "${PN^}")"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

# pypi tarball does not contain tests
RESTRICT="test"
