# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="JupyterLab Server"
HOMEPAGE="https://github.com/jupyter-server/jupyter_server"
SRC_URI="https://github.com/jupyter-server/jupyter_server/archive/${PV}.tar.gz -> jupyter_server-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT=network-sandbox

DEPEND="dev-python/ipython_genutils
	>=www-servers/tornado-6.1
	>=dev-python/jupyter_core-4.4.0
	>=dev-python/jupyter_client-6.1.1
	>=dev-python/pyzmq-17
	>=dev-python/jinja-2.0
	dev-python/nbformat
	dev-python/nbconvert
	dev-python/anyio
	dev-python/prometheus_client
	>=dev-python/terminado-0.8.3
	dev-python/send2trash
	>=dev-python/traitlets-4.2.1"
RDEPEND="${DEPEND}"
