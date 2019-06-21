# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils versionator multilib toolchain-funcs multiprocessing

MY_PN="OpenFOAM"
MY_PV=$(get_version_component_range 1-2)
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Open Field Operation and Manipulation - CFD Simulation Toolbox"
HOMEPAGE="http://www.openfoam.org"
SRC_URI="https://github.com/OpenFOAM/OpenFOAM-6/archive/version-6.tar.gz"
#SRC_URI="https://github.com/OpenFOAM/OpenFOAM-5.x/archive/version-5.0.tar.gz"

LICENSE="GPL-2"
SLOT="6.0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples opendx src paraview"

RDEPEND="sci-mathematics/cgal
	sci-libs/parmetis
	sci-libs/parmgridgen
	>=sci-libs/scotch-6.0.4
	virtual/mpi
	opendx? ( sci-visualization/opendx )
	paraview? ( >=sci-visualization/paraview-5.6[development] )"
DEPEND="${DEPEND}
	doc? ( app-doc/doxygen[dot] )"

S=${WORKDIR}/${MY_P}
INSDIR="/usr/lib64/${MY_PN}/${MY_P}"

pkg_setup() {
	# just to be sure the right profile is selected (gcc-config)
#	if ! version_is_at_least 6.4.0 $(gcc-version) ; then
#		die "${PN} requires >=sys-devel/gcc:6.4.0 to compile."
#	fi

	elog
	elog "In order to use ${MY_PN} you should add the following line to ~/.bashrc :"
	elog
	elog "alias startOF$(delete_all_version_separators ${MY_PV})='source ${INSDIR}/etc/bashrc'"
	elog
	elog "And everytime you want to use OpenFOAM you have to execute startOF$(delete_all_version_separators ${MY_PV})"
}

src_unpack() {
	unpack ${A}
	mv OpenFOAM-6-version-6 ${MY_P}
}

src_configure() {
	epatch ${FILESDIR}/openfoam-6-bashrc_nvidia_libgl.patch
	if has_version sys-cluster/mpich2 ; then
		export WM_MPLIB=MPICH
	elif has_version sys-cluster/openmpi ; then
		export WM_MPLIB=OPENMPI
	else
		die "You need one of the following mpi implementations: openmpi or mpich2"
	fi

	sed -i -e "s|WM_MPLIB:=OPENMPI|WM_MPLIB:="${WM_MPLIB}"|" etc/bashrc
	sed -i -e "s|setenv WM_MPLIB OPENMPI|setenv WM_MPLIB "${WM_MPLIB}"|" etc/cshrc

	sed -i -e "s|^foamInstall=\$HOME|foamInstall=/usr/$(get_libdir)|" etc/bashrc
	sed -i -e "s|^set foamInstall = \$HOME|set foamInstall = /usr/$(get_libdir)|" etc/cshrc

	sed -i -e 's|^export ParaView_DIR=$WM_THIRD_PARTY_DIR/platforms/$WM_ARCH$WM_COMPILER/$paraviewArchName|export ParaView_DIR=/usr/lib64/paraview-5.6/cmake/paraview-5.6|' etc/config.sh/paraview
	sed -i -e 's|^setenv ParaView_DIR $WM_THIRD_PARTY_DIR/platforms/$WM_ARCH$WM_COMPILER/$paraviewArchName|setenv ParaView_DIR /usr/lib64/paraview-5.6|' etc/config.csh/paraview

	sed -i -e 's|^    export ParaView_INCLUDE_DIR=$ParaView_DIR/include/paraview-$ParaView_MAJOR|    export ParaView_INCLUDE_DIR=/usr/include/paraview-5.6|' etc/config.sh/paraview

	sed -i -e 's|^export ParaView_VERSION=5.4.0|export ParaView_VERSION=5.6.0|' etc/config.sh/paraview

}

src_compile() {
#	export WM_NCOMPPROCS=$(makeopts_jobs)

	export FOAM_INST_DIR=${WORKDIR}
	SAVEPATH=${PATH}
	source etc/bashrc

#
#	find wmake -name dirToString -exec rm -rf {} +
#	find wmake -name wmkdep -exec rm -rf {}+

	./Allwmake -j || die "could not build"
	if use doc ; then
		doc/Allwmake || die "could not build"
	fi
	source etc/config.sh/unset
	export PATH=${SAVEPATH}
}

# Doesn't do anything sane
#src_test() {
#	cd bin
#	./foamInstallationTest
#}

src_install() {
	insinto ${INSDIR}
	doins -r etc || die "Install failed!"

	use examples && doins -r tutorials

	use src && doins -r src

	insopts -m0755
	doins -r bin applications platforms wmake || die "Install failed!"

	dodoc README.org doc/Guides/*.pdf

	if use doc ; then
		dohtml -r doc/Doxygen
	fi
}