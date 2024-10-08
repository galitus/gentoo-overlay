# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools (only for 1.0.x)
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python port of Browserscope's user agent parser"
HOMEPAGE="https://github.com/ua-parser/uap-python https://pypi.org/project/ua-parser/"
SRC_URI="$(pypi_sdist_url --no-normalize)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
