# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="SFCGAL is a C++ wrapper library around CGAL with the aim of supporting "
HOMEPAGE="http://www.sfcgal.org/"
SRC_URI="https://gitlab.com/Oslandia/SFCGAL/-/archive/v${PV}/SFCGAL-v${PV}.tar.gz"

SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=">=dev-util/cmake-3.18
	>=dev-util/cunit-2.1
	dev-libs/boost
	>=sci-mathematics/cgal-5.4"

REQUIRED_USE=""

S="${WORKDIR}/SFCGAL-v${PV}"
