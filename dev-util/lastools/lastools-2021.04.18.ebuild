# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit git-r3

DESCRIPTION="efficient tools for LiDAR processing"
HOMEPAGE="https://github.com/LAStools/LAStools"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/LAStools/LAStools.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sci-geosciences/laszip"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}-1

src_install(){
	insinto /usr/bin
	doins src/las2las
	doins src/las2txt
	doins src/lasdiff
	doins src/lasindex
	doins src/lasinfo
	doins src/lasmerge
	doins src/lasprecision
	doins src/laszip
	doins src/txt2las
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
