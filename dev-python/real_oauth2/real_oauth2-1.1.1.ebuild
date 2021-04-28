# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="python-oauth2 is a framework that aims at making it easy to provide authentication via OAuth 2.0 within an application stack."
HOMEPAGE="https://github.com/wndhydrnt/python-oauth2/"
SRC_URI="https://github.com/wndhydrnt/python-oauth2/archive/v${PV}.tar.gz -> oauth2-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}/python-oauth2-${PV}"
