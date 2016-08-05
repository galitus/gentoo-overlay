# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools eutils git-r3

DESCRIPTION="XRDP driver for xorg"
HOMEPAGE="https://github.com/neutrinolabs/xorgxrdp"
SRC_URI=""
EGIT_REPO_URI="git://github.com/neutrinolabs/xrdp"

S=${WORKDIR}/xrdp/xorgxrdp

SLOT="0"
LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
IUSE="static-libs"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

#src_configure() {
#	econf \
#		--enable-manpages \
#		--disable-werror \
#		$(use_enable static-libs static)
#}

#src_install() {
#	default
#	prune_libtool_files
#}
