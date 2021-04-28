# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 python3_9)

inherit distutils-r1 toolchain-funcs

DESCRIPTION="An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture."
HOMEPAGE="https://github.com/jupyterlab/jupyterlab/"
SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v${PV}.tar.gz -> jupyterlab-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT=network-sandbox

DEPEND="net-libs/nodejs
	>=dev-python/notebook-4.3.1
	~dev-python/jupyterlab_server-1.2.0
	>=dev-python/jinja-2.10
	>www-servers/tornado-6.0.4"

RDEPEND="${DEPEND}"
