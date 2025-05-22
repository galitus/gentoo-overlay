# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	_ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/${PN^^}/${PN^^}.git"
	S="${WORKDIR}"/${P}
else
	_ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/${PN^^}/${PN^^}.git"
	EGIT_COMMIT="v4.11.10"
	KEYWORDS="~amd64"
fi

DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=meson-python

inherit fortran-2 flag-o-matic toolchain-funcs ${_ECLASS} distutils-r1 python-utils-r1 python-r1

DESCRIPTION="Spherical harmonic transforms and reconstructions, rotations"
HOMEPAGE="https://github.com/SHTOOLS/SHTOOLS"

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"
RESTRICT="test"

RDEPEND="
	dev-python/xarray
	>=dev-python/scipy-0.14.0
	>=dev-python/astropy-4.0
	dev-python/numpy[${PYTHON_USEDEP},lapack]
	>=dev-python/matplotlib-3.3[${PYTHON_USEDEP}]
	>=dev-python/pooch-1.1
	dev-python/requests
	dev-python/tqdm
	sci-libs/openblas
	sci-libs/fftw:3.0=
	virtual/lapack
	virtual/blas
	${PYTHON_DEPS}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

BDEPEND="dev-python/meson-python
	dev-python/jupyter-core
	"


src_prepare() {
	eapply_user
##	shared doesn't work with the meson part, by activating that flag, meson error with not being able to create fortran binaries
#	append-ldflags -shared # needed by f2py
	# needed by f2py in fortran 77 mode
	append-fflags -fPIC
	[[ $(tc-getFC) =~ gfortran ]] && append-fflags -fno-second-underscore
	export OPTS=(
		LAPACK=$($(tc-getPKG_CONFIG) lapack --libs-only-l)
		BLAS=$($(tc-getPKG_CONFIG) blas --libs-only-l)
		FFTW=$($(tc-getPKG_CONFIG) fftw3 --libs-only-l)
		F95=$(tc-getFC)
		F95FLAGS="${FCFLAGS}"
		AR=$(tc-getAR)
		RLIB=$(tc-getRANLIB)
	)

	distutils-r1_src_prepare
}

python_configure_all() {
        DISTUTILS_ARGS=( --default-library shared )
}


src_compile() {
	emake fortran "${OPTS[@]}"
	distutils-r1_src_compile
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" "${OPTS[@]}" install
	distutils-r1_src_install
	if ! use static-libs; then
		rm -rf "${ED}"/usr/$(get_libdir)/*.a || die
	fi
}
