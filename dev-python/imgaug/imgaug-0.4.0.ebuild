# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1

DESCRIPTION="Image augmentation for machine learning experiments"
HOMEPAGE="https://github.com/aleju/imgaug/"
SRC_URI="https://github.com/aleju/imgaug/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow
	dev-python/scipy
	dev-python/matplotlib
	>=sci-libs/scikit-image-0.14.2
	dev-python/imageio
	dev-python/shapely
	media-libs/opencv
	"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
