# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN="https://gitlab.com/nvidia/container-toolkit/container-toolkit"

inherit go-module git-r3

SLOT="0"

DESCRIPTION="NVIDIA container runtime toolkit"
HOMEPAGE="https://github.com/NVIDIA/nvidia-container-toolkit"
SRC_URI="https://gitlab.com/nvidia/container-toolkit/container-toolkit/-/archive/v${PV}/container-toolkit-v${PV}.tar.gz -> ${P}.tar.gz"
#EGIT_REPO_URI="https://gitlab.com/nvidia/container-toolkit/container-toolkit/"
#EGIT_SUBMODULES=( '' )
#EGIT_BRANCH="v1.8.0"

KEYWORDS="amd64"

LICENSE="Apache-2.0"
SLOT="0"

IUSE=""

RDEPEND="
        sys-libs/libnvidia-container
"

src_compile() {
        cd cmd/nvidia-container-runtime
        go build
}

src_install() {
	dobin nvidia-container-runtime
}
