# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python2_7 python3_6 python3_7 python3_8 python3_9 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Codecov Global Python Uploader"
HOMEPAGE="https://github.com/codecov/codecov-python"
SRC_URI="https://github.com/codecov/codecov-python/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/codecov-python-${PV}"
