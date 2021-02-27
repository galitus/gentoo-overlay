# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DISTUTILS_USE_SETUPTOOLS=bdepend

DESCRIPTION="IPython HTML widgets for Jupyter"
HOMEPAGE="https://ipython.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/notebook[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

python_install_all() {
        distutils-r1_python_install_all

        mkdir -p "${ED}"/etc/ || die
        mv "${ED}"/usr/etc/jupyter "${ED}"/etc/ || die
        rmdir "${ED}"/usr/etc || die
}
