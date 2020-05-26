# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Laspy is a pythonic interface for reading/modifying/creating .LAS LIDAR files matching specification 1.0-1.4."
HOMEPAGE="https://github.com/laspy/laspy"
SRC_URI="https://github.com/laspy/laspy/releases/download/1.7.0/laspy-1.7.0.tar.gz -> laspy-1.7.0.tar.gz"

LICENSE="laspy"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

#DEPEND="net-libs/nodejs"
#RDEPEND="${DEPEND}"

#DOCS=( CHANGELOG README )
#PATCHES=(
#	"${FILESDIR}/cspice_system.patch"
#)

#src_prepare(){
#	eapply_user
#	wget http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z
#	echo "S: ${S}"
#	echo "W: ${W}"
#	mv ${S}/../cspice ${S}
#}

#python_configure_all() {
#        tc-export CC
#        "${PYTHON}" config_unix.py --prefix /usr || die "Configuration failed"
#}

#python_install_all() {
#        distutils-r1_python_install_all
#        insinto /usr/share/doc/${PF}/examples
#        doins test/*
#}

pkg_preinst()
{
	rm -R ${D}/usr/laspytest
}





