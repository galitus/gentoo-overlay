# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{9..11})

inherit distutils-r1 toolchain-funcs

DESCRIPTION="An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture."
HOMEPAGE="https://github.com/jupyterlab/jupyterlab/"
SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v${PV}.tar.gz -> jupyterlab-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#RESTRICT=network-sandbox

DEPEND="dev-python/ipython
	~dev-python/jupyter-packaging-0.9
	dev-python/jupyter_core
	~dev-python/jupyter_server-1.4.0
	~dev-python/jupyterlab_server-2.3.0
	>=dev-python/jinja-2.10
	>=www-servers/tornado-6.1
	>=dev-python/nbclassic-0.2"
#	>=dev-python/notebook-4.3.1

RDEPEND="${DEPEND}"
