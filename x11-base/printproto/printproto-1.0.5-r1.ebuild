# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_MULTILIB=yes
inherit xorg-3

SRC_URI="https://xorg.freedesktop.org/releases/individual/proto/${P}.tar.bz2"

DESCRIPTION="X.Org Print protocol headers"

KEYWORDS="amd64 arm arm64 x86"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
