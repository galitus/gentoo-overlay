# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=pdm-backend
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="The Microsoft Authentication Library (MSAL) for Python library enables your app to access the Microsoft Cloud."
HOMEPAGE="https://pypi.org/project/msal"
#SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" ${PV} ".zip")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="app-arch/unzip"
