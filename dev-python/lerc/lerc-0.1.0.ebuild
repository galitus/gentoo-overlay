# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Lerc"
HOMEPAGE="https://pypi.org/project/lerc"
SRC_URI="mirror://pypi/l/${PN}/${P}.tar.gz"
#SRC_URI="https://files.pythonhosted.org/packages/f2/20/73c8fa29a4ba8f8cbdb037369e6b61ac9253664a8aa0912b52169192447f/lerc-0.1.0.tar.gz"

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
