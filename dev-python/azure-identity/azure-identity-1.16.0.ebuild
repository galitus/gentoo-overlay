# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1

#DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Microsoft Azure Identity Library for Python"
HOMEPAGE="https://pypi.org/project/azure-identity"
#SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" ${PV})"
#SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="app-arch/unzip"
