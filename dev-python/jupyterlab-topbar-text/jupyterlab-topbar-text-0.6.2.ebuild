# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1 pypi

DESCRIPTION="JupyterLab extension to display arbitrary text in the top bar."
HOMEPAGE="https://github.com/jupyterlab-contrib/jupyterlab-topbar/tree/main/packages/topbar-text-extension"
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

src_compile(){
	true
}

src_install(){
	insinto /usr/share/jupyter/labextensions/
        doins -r ${S}/jupyterlab_topbar_text/labextension
        mv ${D}/usr/share/jupyter/labextensions/labextension ${D}/usr/share/jupyter/labextensions/jupyterlab-topbar-text
}
