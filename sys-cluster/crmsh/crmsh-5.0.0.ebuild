# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_OPTIONAL=1

inherit git-r3

if [[ ${PV} == *9999 ]]; then
        EGIT_REPO_URI="https://github.com/crmsh/crmsh"
        S="${WORKDIR}/${PN}-${MY_TREE}"
else
        EGIT_REPO_URI="https://github.com/crmsh/crmsh"
        EGIT_COMMIT="8d89c3d005de6582871d178f79ee44d66ffea8ab"
        KEYWORDS="~amd64 ~hppa ~x86"
fi

inherit autotools distutils-r1

DESCRIPTION="Pacemaker command line interface for management and configuration"
HOMEPAGE="https://crmsh.github.io/"

LICENSE="GPL-2"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
        >=sys-cluster/pacemaker-2.1.2"
RDEPEND="${DEPEND}
        $(python_gen_cond_dep '
                dev-python/lxml[${PYTHON_USEDEP}]
                dev-python/parallax[${PYTHON_USEDEP}]
                dev-python/pyyaml[${PYTHON_USEDEP}]
                dev-python/packaging[${PYTHON_USEDEP}]
                dev-python/build[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
        ')
"

src_prepare() {
        sed -i 's/-m build/-m build -n/g' ${S}/Makefile.am
        sed -i 's=all-local: $(builddir)/dist/crmsh-$(VERSION)-py3-none-any.whl $(builddir)/build=all-local: $(builddir)/build=g' ${S}/Makefile.am
        sed -i '/python3 -m pip*/d' ${S}/Makefile.am
        default

        eautoreconf
}

src_compile() {
        default
        emake
	distutils-r1_src_compile
}

src_install() {
        emake DESTDIR="${D}" install
        distutils-r1_src_install
}
