# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#AUTOTOOLS_AUTORECONF=yes

#inherit autotools-utils multilib
inherit cmake git-r3
CMAKE_BUILD_TYPE="Release"

DESCRIPTION="Hyperion is an opensource 'AmbiLight' implementation with support for many LED devices and video grabbers."
HOMEPAGE="https://github.com/hyperion-project/hyperion.ng"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hyperion-project/hyperion.ng.git"

SLOT="0"
LICENSE="MIT"
KEYWORDS=""

RDEPEND=""
DEPEND=">=net-dns/avahi-0.7[mdnsresponder-compat]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtserialport:5
	dev-qt/qtwidgets:5"

REQUIRED_USE=""

src_install() {
	emake install/strip
}
