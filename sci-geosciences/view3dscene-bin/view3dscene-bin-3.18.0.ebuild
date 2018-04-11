# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="view3dscene - VRML / X3D browser, and a viewer for other 3D model formats"
HOMEPAGE="https://github.com/castle-engine/view3dscene"
SRC_URI="https://github.com/castle-engine/view3dscene/files/1756757/view3dscene-3.18.0-linux-x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
#WORKDIR="${PN}"
S="${WORKDIR}/view3dscene"

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
	dodir /opt/view3dscene
#	ls "${S}"
        cp -aR "${S}"/* "${D}"/opt/view3dscene
}
