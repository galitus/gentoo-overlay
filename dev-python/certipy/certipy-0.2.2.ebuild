# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="A simple python tool for creating certificate authorities and certificates on the fly."
HOMEPAGE="https://github.com/LLNL/certipy"
SRC_URI="https://files.pythonhosted.org/packages/8d/8c/04b8edd906f298d4c23c0db8394784073aedced8559cd55d2de8480774af/certipy-0.2.2.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
