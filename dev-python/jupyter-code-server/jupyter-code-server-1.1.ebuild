# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{10,11,12,13} )

inherit distutils-r1 pypi

DESCRIPTION="Running VSCode Web IDE inside the Jupyter environment"
HOMEPAGE="https://github.com/pc2/jupyter-code-server"
#SRC_URI="https://github.com/brendan-rius/jupyter-c-kernel/archive/${PV}.tar.gz -> jupyter_c_kernel-${PV}.tar.gz"
#SRC_URI="$(pypi_sdist_url --no-normalize "${PN}")"
SRC_URI="$(pypi_wheel_url)"
#EGIT_REPO_URI="https://github.com/pc2/jupyter-code-server"
#EGIT_BRANCH="main"
#EGIT_SUBMODULES=( '*' )

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}"

#src_compile() { :; }

#src_prepare() { :; }

#src_install(){
#	python_setup
#	insinto /usr/share/jupyter/kernels/c/
#	doins "${FILESDIR}"/kernel.json
#}

#src_install() {
#	cp -R ${S}/src/jupyter_code_server ${D}/
#}

src_unpack() {
	unzip "${DISTDIR}/${A}" || die
}

python_compile() {
        distutils_wheel_install "${BUILD_DIR}/install" \
                "${DISTDIR}/$(pypi_wheel_name)"
}
