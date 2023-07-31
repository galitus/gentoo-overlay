# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1 pypi

DESCRIPTION="Top space statusbar for JupyterLab."
HOMEPAGE="https://github.com/jtpio/jupyterlab-topbar"

#SRC_URI="https://github.com/jtpio/jupyterlab-topbar/archive/${PV}.tar.gz -> ${P}.tar.gz"

#SRC_URI="$(pypi_sdist_url "${PN^}")"
#SRC_URI="$(pypi_sdist_url "${PN//-/_}")"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S=${WORKDIR}/${P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
