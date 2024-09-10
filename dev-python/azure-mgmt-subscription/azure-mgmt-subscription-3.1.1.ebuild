# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..12} )

PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Microsoft Azure Subscription Management Client Library for Python"
HOMEPAGE="https://pypi.org/project/azure-mgmt-subscription"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" ${PV} ".zip")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="app-arch/unzip"
