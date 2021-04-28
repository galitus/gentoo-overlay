# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils git-r3

DESCRIPTION="Commercial detector"
HOMEPAGE="https://github.com/BrettSheleski/comchap"
SRC_URI=""
EGIT_REPO_URI="https://github.com/BrettSheleski/comchap"

#S=${WORKDIR}

SLOT="0"
LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
IUSE="static-libs"

RDEPEND=""
DEPEND="net-misc/comskip \
	${RDEPEND}"

#src_prepare() {}

#src_configure() {}

src_install() {
	insinto /usr/bin/
	doins comchap
	doins comcut
	fperms 0755 /usr/bin/comchap
	fperms 0755 /usr/bin/comcut
}
