# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="view3dscene - VRML / X3D browser, and a viewer for other 3D model formats"
HOMEPAGE="https://github.com/castle-engine/view3dscene"
SRC_URI="https://github.com/castle-engine/view3dscene/releases/download/v${PV}/view3dscene-${PV}-linux-x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/view3dscene"

src_configure() { :; }

src_compile() { :; }

src_install() {
	dodir /opt/view3dscene
	cp -aR "${S}"/* "${D}"/opt/view3dscene
}
