# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 python3_10 )

inherit distutils-r1 git-r3

DESCRIPTION="Python client for the kubernetes API."
HOMEPAGE="https://github.com/kubernetes-client/python/"
#SRC_URI="https://github.com/kubernetes-client/python/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/kubernetes-client/python"
EGIT_BRANCH="release-11.0"
EGIT_SUBMODULES=( '*' )

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

#RDEPEND=">=dev-python/sqlalchemy-0.8[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	>=dev-python/google-auth-1.0.1
	>=dev-python/python-dateutil-2.5.3
	dev-python/certifi
	>=dev-python/six-1.9.0
	>=dev-python/setuptools-21.0.0
	>=dev-python/pyyaml-3.12
	>=dev-python/ipaddress-1.0.17
	>=dev-python/websocket-client-0.50
	dev-python/requests
	dev-python/requests-oauthlib
	>=dev-python/urllib3-1.24.2
"

#S=${WORKDIR}/python-${PV}
