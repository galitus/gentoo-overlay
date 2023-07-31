# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 python3_11 python3_12 )

inherit distutils-r1

DESCRIPTION="Use Shapely or GeoJSON-like geometric objects as matplotlib paths and patches"
HOMEPAGE="https://pypi.org/project/descartes/"
SRC_URI="https://files.pythonhosted.org/packages/1d/6f/81735a30432b74f41db6754dd13869021ccfed3088d1cf7a6cfc0af9ac49/descartes-1.1.0.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

#RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/matplotlib
"
