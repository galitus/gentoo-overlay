# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 python3_11 python3_12 )

inherit distutils-r1

DESCRIPTION="TensorFlow implementation of focal loss: a loss function generalizing binary and multiclass cross-entropy loss that penalizes hard-to-classify examples."
HOMEPAGE="https://github.com/artemmavrin/focal-loss"
SRC_URI="https://github.com/artemmavrin/focal-loss/archive/r${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"
S="${WORKDIR}/${PN}-r${PV}"

RDEPEND=">=sci-libs/tensorflow-2.2.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
"

#PATCHES="${FILESDIR}/class_weight.patch"
