# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Spice - NAIF Toolkit for IDL"
HOMEPAGE="https://naif.jpl.nasa.gov/naif/toolkit_IDL_PC_Linux_GCC_IDL8.x_64bit.html"
SRC_URI="http://naif.jpl.nasa.gov/pub/naif/toolkit//IDL/PC_Linux_GCC_IDL8.x_64bit/packages/icy.tar.Z"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}"/icy

src_compile() {
#	cd "${S}"
	"${S}"/makeall.csh
}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins "${S}"/lib/icy*
}
