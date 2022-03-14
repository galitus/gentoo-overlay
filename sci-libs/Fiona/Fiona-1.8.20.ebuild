# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1

DESCRIPTION="OGR's neat, nimble, no-nonsense API"
HOMEPAGE="https://github.com/Toblerity/Fiona"
SRC_URI="https://github.com/Toblerity/Fiona/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=sci-libs/gdal-1.11
	dev-python/click[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/attrs
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/cligj[${PYTHON_USEDEP}]
		dev-python/munch[${PYTHON_USEDEP}]
		dev-python/click-plugins[${PYTHON_USEDEP}]
	)"

#PATCHES=( "${FILESDIR}"/scriptname-${PV}.patch )

#python_test() {
#	esetup.py test
#}

#	dev-python/click-plugins
#	dev-python/cligj
#	dev-python/munch
