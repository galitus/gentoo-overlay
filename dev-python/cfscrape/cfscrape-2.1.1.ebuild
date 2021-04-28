# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_7 python3_8 )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="A Python module to bypass Cloudflare's anti-bot page."
HOMEPAGE="https://github.com/Anorov/cloudflare-scrape"
SRC_URI="https://github.com/Anorov/cloudflare-scrape/archive/${PV}.tar.gz -> cfscrape-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/requests"
RDEPEND="${DEPEND}"

S="${WORKDIR}/cloudflare-scrape-${PV}"
