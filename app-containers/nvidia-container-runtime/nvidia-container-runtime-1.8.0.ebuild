# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN="https://gitlab.com/nvidia/container-toolkit/container-toolkit"

inherit go-module git-r3

SLOT="0"

DESCRIPTION="NVIDIA container runtime toolkit"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-toolkit"
EGIT_REPO_URI="https://gitlab.com/nvidia/container-toolkit/container-toolkit/"
EGIT_SUBMODULES=( '*' )

#WORKDIR="${S}/container-toolkit/cmd/nvidia-container-toolkit"
S="${WORKDIR}/cmd/nvidia-container-toolkit"

KEYWORDS="amd64"

src_install() {
	dobin nvidia-container-runtime
}
