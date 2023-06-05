# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	_ECLASS="git-r3"
	EGIT_REPO_URI="https://github.com/${PN^^}/${PN^^}.git"
	S="${WORKDIR}"/${P}
else
	SRC_URI="https://github.com/${PN^^}/${PN^^}/archive/v${PV/_/-}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}"/${PN^^}-${PV/_/-}
fi

PYTHON_COMPAT=( python3_{6,7,8,9,10,11,12} )

inherit fortran-2 flag-o-matic toolchain-funcs ${_ECLASS} distutils-r1

DESCRIPTION="Spherical harmonic transforms and reconstructions, rotations"
HOMEPAGE="https://github.com/SHTOOLS/SHTOOLS"

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

RDEPEND="
	dev-python/xarray
	dev-python/scipy
	dev-python/astropy
	dev-python/numpy[${PYTHON_USEDEP},lapack]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pooch
	sci-libs/fftw:3.0=
	virtual/lapack
	virtual/blas
	${PYTHON_DEPS}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	python_setup
	distutils-r1_python_prepare_all
#	epatch "${FILESDIR}"/shtools_www.patch
#	eapply "${FILESDIR}"/shtools_ar_instead_libtool.patch
	append-ldflags -shared # needed by f2py
	# needed by f2py in fortran 77 mode
	append-fflags -fPIC
	[[ $(tc-getFC) =~ gfortran ]] && append-fflags -fno-second-underscore
	export _pyver=$(python_is_python3 && echo 3 || echo 2)
	export OPTS=(
		LAPACK=$($(tc-getPKG_CONFIG) lapack --libs-only-l)
		BLAS=$($(tc-getPKG_CONFIG) blas --libs-only-l)
		FFTW=$($(tc-getPKG_CONFIG) fftw3 --libs-only-l)
		F95=$(tc-getFC)
		F95FLAGS="${FCFLAGS}"
		AR=$(tc-getAR)
		RLIB=$(tc-getRANLIB)
		PYTHON_VERSION=${_pyver}
	)

#	sed \
#		-e '/mv/s:.so:*.so:g' \
#		-e "/SYSDOCPATH/s:${PN}:${PF}:g" \
#		-e "/www/s:/$:/html/:g" \
#		-i Makefile || die
	sed -i s/f2py3/f2py/g Makefile
	cp ${FILESDIR}/site.cfg ${S}/

	default
}

src_configure () {
#	python_setup
	sed -i s/"'include_dirs': \[\]"/"'include_dirs': \[\"\/usr\/lib64\/${EPYTHON}\/site-packages\/numpy\/f2py\/src\"\]"/g setup.py
}

src_compile() {
	emake fortran "${OPTS[@]}"
#	distutils-r1_python_compile
#	default
	"${PYTHON}" setup.py build || die
#	${EPYTHON} setup.py build
#	${EPYTHON} setup.py install
#	python_build
#	emake python${_pyver} "${OPTS[@]}"
	default
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" "${OPTS[@]}" install
#	${EPYTHON} setup.py install
#	python_install
#	default
	distutils-r1_python_install
	if ! use static-libs; then
		rm -rf "${ED}"/usr/$(get_libdir)/*.a || die
	fi
}
