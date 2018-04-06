# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="Embree is a collection of high-performance ray tracing kernels, developed at Intel."
HOMEPAGE="https://github.com/embree/embree"
SRC_URI="https://github.com/embree/embree/releases/download/v2.17.4/embree-2.17.4.x86_64.linux.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P}.x86_64.linux"


#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

#src_compile() {
#	cd ${S}
#	${S}/makeall.csh
#}

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins ${S}/lib/libembree*
	insinto /usr/include/
	insopts -m 0755 -o root -g root
	doins -r ${S}/include/embree2
}
