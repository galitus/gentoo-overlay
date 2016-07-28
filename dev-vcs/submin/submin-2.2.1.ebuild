# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1

DESCRIPTION="Provides a web-based admin interface to your SVN and git repositories."
HOMEPAGE="https://supermind.nl/submin/"
SRC_URI="http://supermind.nl/submin/current/${P}-1.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="mail-mta/postfix"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}-1
