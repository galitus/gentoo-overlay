# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Asynchronous (AsyncIO) client library for the Kubernetes API."
HOMEPAGE="https://github.com/tomplus/kubernetes_asyncio"
SRC_URI="https://github.com/tomplus/kubernetes_asyncio/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
#IUSE="test"

S="${WORKDIR}/${PN//-/_}-${PV}"

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
