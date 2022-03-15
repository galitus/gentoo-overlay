# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="GeoHashTree for Point Cloud Data"
HOMEPAGE="https://github.com/pramsey/libght"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pramsey/libght.git"

#LICENSE="GPL-2 gmttria? ( Artistic )"
SLOT="0"
LICENSE="BSD-3"
KEYWORDS=""
#IUSE="static-libs"

RDEPEND=""
DEPEND=">=sci-geosciences/liblas-1.8.0
	>=dev-util/cmake-3.7.2
	>=dev-util/cunit-2.1
	>=dev-libs/libxml2-2.9.4"

REQUIRED_USE=""

#PATCHES=(
#	"${FILESDIR}/fix_old_proj_api_usage.patch"
#)
