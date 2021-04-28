# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Multi-user server for Jupyter notebooks"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub"
SRC_URI="https://github.com/jupyterlab/jupyterlab_server/archive/v${PV}.tar.gz -> jupyterlab_server-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/pyjson5
	>=dev-python/jsonschema-3.0.1
	>=dev-python/notebook-4.2.0
	>=dev-python/jinja-2.10"
RDEPEND="${DEPEND}"
