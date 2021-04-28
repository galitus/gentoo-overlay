# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Embree is a collection of high-performance ray tracing kernels, developed at Intel."
HOMEPAGE="https://github.com/embree/embree"
SRC_URI="https://github.com/embree/embree/releases/download/v${PV}/embree-${PV}.x86_64.linux.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P}.x86_64.linux"

src_install() {
	insinto /usr/lib64/
	insopts -m 0644 -o root -g root
	doins "${S}"/lib/libembree*
	insinto /usr/include/
	insopts -m 0755 -o root -g root
	doins -r "${S}"/include/embree2
}
