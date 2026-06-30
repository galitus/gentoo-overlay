# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=flit-core

inherit distutils-r1
#pypi

DESCRIPTION="PyTorch Geometric"
HOMEPAGE="https://pypi.org/project/torch-geometric/"
#SRC_URI="$(pypi_sdist_url)"
SRC_URI="https://github.com/pyg-team/pytorch_geometric/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/pytorch_geometric-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
RESTRICT=""

RDEPEND="sci-ml/pytorch"
DEPEND="${RDEPEND}"
