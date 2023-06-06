# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 pypi

DESCRIPTION="Lerc"
HOMEPAGE="https://pypi.org/project/lerc"
SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( dev-python/mock[${PYTHON_USEDEP}] )"
RDEPEND=""

#distutils_enable_tests setup.py

#src_prepare() {
#	eapply_user
#	sed -i -e 's:test_fetch_timestamp_from_git_tree:_&:' \
#		tests/test_utils.py || die
#}
