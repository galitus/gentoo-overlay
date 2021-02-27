# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Global Self-consistent, Hierarchical, High-resolution Shoreline programs"
HOMEPAGE="https://gmt.soest.hawaii.edu/"
SRC_URI="ftp://ftp.iris.washington.edu/pub/gmt/gshhg-gmt-2.3.7.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86 ~amd64-linux ~x86-linux"
#IUSE="+data"

#RDEPEND="sci-libs/netcdf
#	sci-libs/gdal
#	data? ( sci-geosciences/gshhs-data )"
#DEPEND="${RDEPEND}
#	virtual/pkgconfig
#	app-arch/unzip"

#S="${WORKDIR}"

src_install() {
        dodoc README.TXT
#        rm gshhg/README.TXT || die
        insinto /usr/share/gshhg/
        doins -r *.nc
}

