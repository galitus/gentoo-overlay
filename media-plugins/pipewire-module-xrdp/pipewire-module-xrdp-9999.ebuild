# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools git-r3

DESCRIPTION="xrdp sink / source pipewire module (WIP)"
HOMEPAGE="https://github.com/matt335672/pipewire-module-xrdp"

EGIT_REPO_URI="https://github.com/matt335672/pipewire-module-xrdp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND="
	net-misc/xrdp
	media-video/pipewire
"

src_prepare() {
	eapply_user

	./bootstrap
#	./configure
}

src_install() {
	default
	prune_libtool_files --all
}

