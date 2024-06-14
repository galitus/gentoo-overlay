# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit webapp

MY_P="${P//_/}"

DESCRIPTION="Web-based browsing tool for Subversion (SVN) repositories in PHP"
HOMEPAGE="https://websvnphp.github.io/ https://github.com/websvnphp/websvn"
SRC_URI="https://github.com/websvnphp/websvn/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
IUSE="enscript"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="dev-lang/php:*[xml]
	dev-vcs/subversion
	virtual/httpd-php:*"
#	enscript? ( app-text/enscript )"
RESTRICT="mirror"

PATCHES=(
)

#S="${WORKDIR}/${MY_P}"

src_install() {
	webapp_src_preinst

#	DOCS=( changes.txt )
#	HTML_DOCS=( doc/* )
#	einstalldocs

	mv include/{dist,}config.php
	rm -rf license.txt changes.txt doc/

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_configfile "${MY_HTDOCSDIR}"/include/config.php
#	webapp_configfile "${MY_HTDOCSDIR}"/wsvn.php

	webapp_serverowned "${MY_HTDOCSDIR}"/cache

	webapp_src_install
}
