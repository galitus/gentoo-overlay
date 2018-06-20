# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="Spice - NAIF Toolkit for IDL"
HOMEPAGE="https://naif.jpl.nasa.gov/naif/toolkit_IDL_PC_Linux_GCC_IDL8.x_64bit.html"
SRC_URI="http://naif.jpl.nasa.gov/pub/naif/toolkit//IDL/PC_Linux_GCC_IDL8.x_64bit/packages/icy.tar.Z"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
S=${WORKDIR}/icy

#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

src_compile() {
	cd ${S}
	${S}/makeall.csh
}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins ${S}/lib/icy*
#	insinto /usr/bin/
#	insopts -m 00755 -o root -g root
#	doins ${S}/exe/*
#	insinto /usr/include/${PN}/
#	insopts -m 0755 -o root -g root
#	doins ${S}/include/*

#	dopammod .libs/pam_afs_session.so
#	doman pam_afs_session.5
#	dodoc NEWS README TODO
}
