# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="A simple python tool for creating certificate authorities and certificates on the fly."
HOMEPAGE="https://github.com/LLNL/certipy"
SRC_URI="https://files.pythonhosted.org/packages/3a/b3/f9228354c1eac06cd3577a981571b9188392d73d583fcaa7a8f3fb374a56/certipy-0.1.3.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
