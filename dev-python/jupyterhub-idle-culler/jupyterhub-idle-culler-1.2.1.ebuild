# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="JupyterHub Idle Culler Service"
HOMEPAGE="https://github.com/jupyterhub/jupyterhub-idle-culler"
SRC_URI="https://github.com/jupyterhub/jupyterhub-idle-culler/archive/refs/tags/${PV}.tar.gz -> jupyterhub-idle-culler-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/jupyterhub
	dev-python/python-dateutil"
RDEPEND="${DEPEND}"
