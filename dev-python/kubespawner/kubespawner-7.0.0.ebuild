# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="The kubespawner (also known as JupyterHub Kubernetes Spawner) enables JupyterHub to spawn single-user notebook servers on a Kubernetes cluster."
HOMEPAGE="https://github.com/jupyterhub/kubespawner/"
SRC_URI="https://github.com/jupyterhub/kubespawner/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

#RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/escapism
	dev-python/python-slugify
	>=dev-python/jupyterhub-4.0
	dev-python/jinja2
	>=dev-python/kubernetes-asyncio-24
	dev-python/urllib3
	dev-python/traitlets
	dev-python/pyyaml
"
