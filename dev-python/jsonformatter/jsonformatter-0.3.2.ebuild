# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

#MY_P=speaklater3-${PV}
DESCRIPTION="jsonformatter is a formatter for python output json log, e.g. output LogStash needed log."
HOMEPAGE="https://pypi.org/project/jsonformatter/"
SRC_URI="$(pypi_sdist_url "${PN}")"
#S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

