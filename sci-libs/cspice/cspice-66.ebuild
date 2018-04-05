# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="CSpice - NAIF Toolkit for C"
HOMEPAGE="https://naif.jpl.nasa.gov/naif/toolkit_C_PC_Linux_GCC_64bit.html"
SRC_URI="http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
S=${WORKDIR}/${PN}

#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

src_compile() {
	cd ${WORKDIR}/${PN}
	${WORKDIR}/${PN}/makeall.csh
}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins ${S}/lib/*.a
	insinto /usr/include/naif/${PN}/
	insopts -m 0755 -o root -g root
	doins ${S}/include/*

#	dopammod .libs/pam_afs_session.so
#	doman pam_afs_session.5
#	dodoc NEWS README TODO
}
