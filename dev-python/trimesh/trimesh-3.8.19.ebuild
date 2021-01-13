# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Trimesh is a pure Python (2.7-3.4+) library for loading and using triangular meshes with an emphasis on watertight surfaces."
HOMEPAGE="https://github.com/mikedh/trimesh/"
SRC_URI="https://github.com/mikedh/trimesh/archive/${PV}.tar.gz"

LICENSE="laspy"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-util/lastools"
RDEPEND="${DEPEND}"

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

#pkg_preinst()
#{
#	rm -R ${D}/usr/laspytest
#}





