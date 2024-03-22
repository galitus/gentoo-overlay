# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1 pypi

DESCRIPTION="Hatch plugin to read pyproject.toml metadata from package.json "
HOMEPAGE="https://github.com/agoose77/hatch-nodejs-version"
SRC_URI="$(pypi_sdist_url)"
#S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-python/hatchling
	"

