# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="The bidirectional mapping library for Python."
HOMEPAGE="https://github.com/jab/bidict"
SRC_URI="https://github.com/jab/bidict/archive/refs/tags/v${PV}.tar.gz -> bidict-{$PV}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-python/setuptools_scm
	dev-python/setuptools
	dev-python/wheel
	"

RDEPEND="${DEPEND}"
