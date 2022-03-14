# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1 toolchain-funcs python-utils-r1 python-r1

DESCRIPTION="Top space statusbar for JupyterLab."
HOMEPAGE="https://github.com/jtpio/jupyterlab-topbar"
#SRC_URI="https://github.com/jtpio/jupyterlab-topbar/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
