# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 pypi

DESCRIPTION="PyTorch Sparse"
HOMEPAGE="https://pypi.org/project/torch-sparse/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
RESTRICT=""

RDEPEND="sci-libs/pytorch"
DEPEND="${RDEPEND}"
