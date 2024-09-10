# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1 pypi

MY_PN="Flask-Mail"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Flask extension for sending email"
HOMEPAGE="https://pythonhosted.org/Flask-Mail/ https://pypi.org/project/Flask-Mail/"
#SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
SRC_URI="$(pypi_sdist_url --no-normalize "${MY_PN}")"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~riscv x86"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]"
#BDEPEND="
#	test? (
#		dev-python/mock[${PYTHON_USEDEP}]
#		dev-python/speaklater[${PYTHON_USEDEP}] )"

distutils_enable_sphinx docs
#distutils_enable_tests nose
