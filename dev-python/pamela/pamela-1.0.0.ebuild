# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Pamela: yet another Python wrapper for PAM"
HOMEPAGE="https://github.com/minrk/pamela"
SRC_URI="https://github.com/minrk/pamela/archive/1.0.0.tar.gz -> pamela-1.0.0.tar.gz"

LICENSE="BSD"
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






