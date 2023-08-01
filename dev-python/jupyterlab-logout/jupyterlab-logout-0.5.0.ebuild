# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1 pypi

DESCRIPTION="Logout Button for JupyterLab"
HOMEPAGE="https://github.com/jupyterlab-contrib/jupyterlab-logout"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S=${WORKDIR}/${P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-python/jupyter-packaging
	dev-python/jupyterlab
	"

