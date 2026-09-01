# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Image augmentation for machine learning experiments"
HOMEPAGE="https://github.com/imaug/imaug"
SRC_URI="https://github.com/imaug/imaug/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow
	dev-python/scipy
	dev-python/matplotlib
	>=dev-python/scikit-image-0.18
	dev-python/imageio
	dev-python/shapely
	media-libs/opencv
	>=dev-python/imagecorruptions-imaug-1.1.5
	"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
