# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="VICAR - Binary Edition"
HOMEPAGE="https://www-mipl.jpl.nasa.gov/vicar_open.html"
SRC_URI="https://github.com/NASA-AMMOS/VICAR/releases/download/${PV}/vicar_open_bin_x86-64-linx_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="~x11-libs/libXp-1.0.3
	media-libs/tiff
	"
RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
S="${WORKDIR}/vicar_open_bin_x86-64-linx_${PV}/vicar_open_${PV}"

#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

src_configure() { :; }

src_compile() { :; }

src_install() {
#	insinto /opt/vicar
#	insopts -m 0755 -o root -g root
#	doins -r ${S}/*
	dodir /opt/vicar
#	ls "${S}"
	cp -aR "${S}"/* "${D}"/opt/vicar
	rm -R "${D}"/opt/vicar/external
	dodir /opt/vicar/external
	cp -aR "${WORKDIR}"/vicar_open_bin_x86-64-linx_"${PV}"/vicar_open_ext_x86-64-linx_"${PV}"/* "${D}"/opt/vicar/external
}
