# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="CSpice - NAIF Toolkit for C"
HOMEPAGE="https://naif.jpl.nasa.gov/naif/toolkit_C_PC_Linux_GCC_64bit.html"
SRC_URI="http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_compile() {
	cd "${WORKDIR}"/"${PN}"/lib/
	ar -x cspice.a
	ar -x csupport.a
	gcc -shared -fPIC -lm *.o -o spice.so
	cd "${WORKDIR}"/"${PN}"
	"${WORKDIR}"/"${PN}"/makeall.csh
}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins "${S}"/lib/*.a
	doins "${S}"/lib/spice.so
	insinto /usr/bin/
	insopts -m 00755 -o root -g root
	doins "${S}"/exe/*
	insinto /usr/include/"${PN}"/
	insopts -m 0755 -o root -g root
	doins "${S}"/include/*
	doenvd "${FILESDIR}"/97cspice
}
