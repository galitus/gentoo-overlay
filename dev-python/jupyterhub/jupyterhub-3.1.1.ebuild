# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Multi-user server for Jupyter notebooks"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub"
SRC_URI="https://github.com/jupyterhub/jupyterhub/archive/${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT=network-sandbox

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/nodejs
	dev-python/alembic
	>=dev-python/async_generator-1.9
	dev-python/certipy
	dev-python/entrypoints
	>=dev-python/jinja-2.11
	>=dev-python/oauthlib-3.0
	dev-python/pamela
	dev-python/prometheus-client
	dev-python/python-dateutil
	dev-python/requests
	dev-python/sqlalchemy
	net-misc/configurable-http-proxy
	>=dev-python/tornado-5.1
	>=dev-python/traitlets-4.3.2
	dev-python/jupyter-telemetry"
RDEPEND="${DEPEND}"
