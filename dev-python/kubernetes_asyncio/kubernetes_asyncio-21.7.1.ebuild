# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 python3_10 )

inherit distutils-r1

DESCRIPTION="Asynchronous (AsyncIO) client library for the Kubernetes API."
HOMEPAGE="https://github.com/tomplus/kubernetes_asyncio"
SRC_URI="https://github.com/tomplus/kubernetes_asyncio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

DEPEND="${RDEPEND}
	>=dev-python/python-dateutil-2.5.3
	dev-python/certifi
	>=dev-python/six-1.9.0
	>=dev-python/setuptools-21.0.0
	>=dev-python/pyyaml-3.12
	>=dev-python/urllib3-1.24
	=dev-python/aiohttp-3*
"

#S=${WORKDIR}/python-${PV}
