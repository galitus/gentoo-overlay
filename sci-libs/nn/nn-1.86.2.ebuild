# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils git-r3

DESCRIPTION="nn is a C code for Natural Neighbours interpolation of 2D scattered data. It provides a C library and a command line utility nnbathy"
HOMEPAGE="https://github.com/sakov/nn-c"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/sakov/nn-c.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S=${WORKDIR}/${P}/nn

src_prepare() {
	eapply "${FILESDIR}"/nn_shared.patch

	eapply_user
}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins "${S}"/*.a
	doins "${S}"/*.o
	insinto /usr/include/nn/
	insopts -m 0755 -o root -g root
	doins "${S}"/*.h
	insinto /usr/bin/
	insopts -m 0755 -o root -g root
	doins "${S}"/nnbathy
}
