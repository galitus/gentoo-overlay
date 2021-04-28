# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Laspy is a pythonic interface for reading/modifying/creating .LAS LIDAR files matching specification 1.0-1.4."
HOMEPAGE="https://github.com/laspy/laspy"
SRC_URI="https://github.com/laspy/laspy/releases/download/${PV}/laspy-${PV}.tar.gz -> laspy-${PV}.tar.gz"

LICENSE="laspy"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-util/lastools"
RDEPEND="${DEPEND}"

pkg_preinst()
{
	rm -R "${D}"/usr/laspytest
}
