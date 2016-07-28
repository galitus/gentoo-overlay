# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit pam

DESCRIPTION="OpenAFS PAM Module"
HOMEPAGE="http://www.eyrie.org/~eagle/software/pam-afs-session/"
SRC_URI="http://archives.eyrie.org/software/afs/${P}.tar.gz"

LICENSE="HPND openafs-krb5-a"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="virtual/pam sys-auth/pam_krb5"
RDEPEND="${DEPEND}"

#src_compile() {
#	econf || die "econf failed"
#	emake || die "emake failed"
#}

src_install() {
	dopammod .libs/pam_afs_session.so
	doman pam_afs_session.5
	dodoc NEWS README TODO
}
