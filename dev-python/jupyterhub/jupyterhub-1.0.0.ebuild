# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Multi-user server for Jupyter notebooks"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub"
SRC_URI="https://github.com/jupyterhub/jupyterhub/archive/${PV}.tar.gz -> jupyterhub-${PV}.tar.gz"

RESTRICT=network-sandbox

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/nodejs
	dev-python/alembic
	>=dev-python/async_generator-1.8
	dev-python/certipy
	dev-python/entrypoints
	>=dev-python/jinja-2.0
	>=dev-python/oauthlib-3.0
	dev-python/pamela
	dev-python/prometheus_client
	dev-python/python-dateutil
	dev-python/requests
	dev-python/sqlalchemy
	net-misc/configurable-http-proxy
	>=www-servers/tornado-5.0
	dev-python/traitlets"
RDEPEND="${DEPEND}"
