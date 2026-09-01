# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python package to corrupt arbitrary images."
HOMEPAGE="https://github.com/imaug/imagecorruptions"
SRC_URI="https://github.com/imaug/imagecorruptions/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	>=dev-python/pillow-5.4.1
	>=dev-python/scipy-1.2.1
	>=dev-python/numba-0.53.0
	dev-python/matplotlib
	>=dev-python/scikit-image-0.15
	dev-python/imageio
	dev-python/shapely
	>=media-libs/opencv-3.4.5
	"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
