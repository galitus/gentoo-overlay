# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit autotools

DESCRIPTION="efficient tools for LiDAR processing"
HOMEPAGE="https://github.com/LAStools/LAStools"
SRC_URI="https://github.com/LAStools/LAStools/archive/refs/tags/v2.0.2.tar.gz"
#EGIT_REPO_URI="https://github.com/LAStools/LAStools.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sci-geosciences/laszip"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}-1

src_install(){
	insinto /usr/bin
	doins bin/las2las
	doins bin/las2txt
	doins bin/lasdiff
	doins bin/lasindex
	doins bin/lasinfo
	doins bin/lasmerge
	doins bin/lasprecision
	doins bin/laszip
	doins bin/txt2las
	fperms +x /usr/bin/las2las
	fperms +x /usr/bin/las2txt
	fperms +x /usr/bin/lasdiff
	fperms +x /usr/bin/lasindex
	fperms +x /usr/bin/lasinfo
	fperms +x /usr/bin/lasmerge
	fperms +x /usr/bin/lasprecision
	fperms +x /usr/bin/laszip
	fperms +x /usr/bin/txt2las

}
