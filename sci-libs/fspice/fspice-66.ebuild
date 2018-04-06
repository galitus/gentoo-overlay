# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="Spice - NAIF Toolkit for Fortran"
HOMEPAGE="https://naif.jpl.nasa.gov/naif/toolkit_FORTRAN_PC_Linux_gfortran_64bit.html"
SRC_URI="http://naif.jpl.nasa.gov/pub/naif/toolkit//FORTRAN/PC_Linux_gfortran_64bit/packages/toolkit.tar.Z"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
S=${WORKDIR}/toolkit

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
	doins ${S}/lib/*.a
	#insinto /usr/include/naif/${PN}/
	#insopts -m 0755 -o root -g root
	#doins ${S}/include/*
}
