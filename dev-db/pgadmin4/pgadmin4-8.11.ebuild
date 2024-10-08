# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..12} )
PYTHON_REQ_USE="sqlite"
inherit desktop python-single-r1 qmake-utils xdg

DESCRIPTION="GUI administration and development platform for PostgreSQL"
HOMEPAGE="https://www.pgadmin.org/"
SRC_URI="https://ftp.postgresql.org/pub/pgadmin/${PN}/v${PV}/source/${P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc -client server -cloud"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="test network-sandbox"

# libsodium dep added because of 689678
COMMON_DEPEND="${PYTHON_DEPS}
	client? (
		dev-libs/libsodium[-minimal]
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtnetwork:5[ssl]
		dev-qt/qtwidgets:5
	)
	server? (
		sys-apps/yarn
		www-apache/mod_wsgi
		dev-vcs/git
	)
"
DEPEND="${COMMON_DEPEND}
	doc? (
		$(python_gen_cond_dep '
			dev-python/sphinx[${PYTHON_USEDEP}]
		')
	)
	client? (
		virtual/imagemagick-tools[png]
	)
"

# In 4.25's requirement.txt, bcrypt is listed as <=3.17, but upstream's
# git history shows this is just for compatibility with <python-3.6.
# In 4.26's requirement.txt, cryptography is listed as <=3.0, but upstream's
# git history shows this is just for compatibility with Windows.
RDEPEND="${COMMON_DEPEND}
	$(python_gen_cond_dep '
		>=dev-python/Authlib-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/boto3-1.35.0[${PYTHON_USEDEP}]
		>=dev-python/botocore-1.35.0[${PYTHON_USEDEP}]
		>=dev-python/eventlet-0.36.1[${PYTHON_USEDEP}]
		>=dev-python/flask-3.0[${PYTHON_USEDEP}]
		>=dev-python/flask-babel-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/flask-compress-1.10.1[${PYTHON_USEDEP}]
		>=dev-python/flask-gravatar-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/flask-login-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/flask-mail-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/flask-migrate-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/flask-paranoid-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/flask-security-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/flask-sqlalchemy-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/flask-socketio-5.3.0[${PYTHON_USEDEP}]
		>=dev-python/flask-wtf-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/greenlet-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/gssapi-1.8.0[${PYTHON_USEDEP}]
		>=dev-python/httpagentparser-1.9.1[${PYTHON_USEDEP}]
		>=dev-python/ldap3-2.8.1[${PYTHON_USEDEP}]
		>=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-9.5.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9.0[${PYTHON_USEDEP}]
		>=dev-python/pyotp-2.6.0[${PYTHON_USEDEP}]
		>=dev-python/psycopg-3.1.12[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/pytz-2024.0[${PYTHON_USEDEP}]
		>=dev-python/qrcode-7.3.1[${PYTHON_USEDEP}]
		>=dev-python/speaklater-1.4[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
		>=dev-python/sqlparse-0.4.2[${PYTHON_USEDEP}]
		>=dev-python/sshtunnel-0.3.1[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.26.8[${PYTHON_USEDEP}]
		>=dev-python/user-agents-2.2[${PYTHON_USEDEP}]
		>=dev-python/werkzeug-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/wtforms-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-4.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12.3[${PYTHON_USEDEP}]
		>=dev-python/jsonformatter-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/cryptography-42.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
		>=dev-python/keyring-25.3.0[${PYTHON_USEDEP}]
		>=dev-python/isodate-0.6.1-r1[${PYTHON_USEDEP}]
		cloud? (
			>=dev-python/azure-core-1.30.1[${PYTHON_USEDEP}]
			>=dev-python/azure-identity-1.16.0[${PYTHON_USEDEP}]
			>=dev-python/azure-common-1.1.28[${PYTHON_USEDEP}]
			>=dev-python/azure-mgmt-core-1.4.0[${PYTHON_USEDEP}]
			>=dev-python/azure-mgmt-resource-23.0.1[${PYTHON_USEDEP}]
			>=dev-python/azure-mgmt-subscription-3.1.1[${PYTHON_USEDEP}]
			>=dev-python/azure-mgmt-rdbms-10.1.0[${PYTHON_USEDEP}]
			>=dev-python/google-api-python-client-2.113.0[${PYTHON_USEDEP}]
			>=dev-python/google-auth-oauthlib-1.2.0-r1[${PYTHON_USEDEP}]
			dev-python/msal[${PYTHON_USEDEP}]
			dev-python/msrest[${PYTHON_USEDEP}]
		)
	')
"
#		dev-python/python-email-validator[${PYTHON_USEDEP}]
#		>=dev-python/blinker-1.4[${PYTHON_USEDEP}]
#		>=dev-python/flask-principal-0.4.0[${PYTHON_USEDEP}]
#		>=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
#		>=dev-python/simplejson-3.17.0[${PYTHON_USEDEP}]
#		>=dev-python/six-1.16.0[${PYTHON_USEDEP}]

#if use client ; then
#	S="${WORKDIR}"/${P}/runtime
#else
#	S="${WORKDIR}"/${P}/web
#fi

src_prepare() {
	cd "${WORKDIR}"/${P} || die
	default
}

src_configure() {
	export PGADMIN_PYTHON_DIR="${EPREFIX}/usr"
	if use client ; then
		eqmake5
	fi
#		python_all_src_configure
}

src_compile() {
	use client && default
	use doc && emake -C "${WORKDIR}"/${P} docs
        cd "${WORKDIR}"/${P}
        emake install-node
        emake bundle
}

src_install() {
	if ! use cloud; then
		cd ${S}/web/pgadmin/misc/
		eapply ${FILESDIR}/cloud.patch
	fi
	if use client; then
		dobin pgAdmin4
	fi

	cd "${WORKDIR}"/${P} || die

	local APP_DIR=/usr/share/${PN}/web
	insinto "${APP_DIR}"
	doins -r web/.
	if use client ; then
		newins - config_local.py <<-EOF
			SERVER_MODE = False
			UPGRADE_CHECK_ENABLED = False
		EOF
	fi
	if use server ; then
#		cd "${WORKDIR}"/${P}/web
	        newins - config_local.py <<-EOF
		LOG_FILE = '/var/log/pgadmin4/pgadmin4.log'
		SQLITE_PATH = '/var/lib/pgadmin4/pgadmin4.db'
		SESSION_DB_PATH = '/var/lib/pgadmin4/sessions'
		STORAGE_DIR = '/var/lib/pgadmin4/storage'
		AZURE_CREDENTIAL_CACHE_DIR = '/var/lib/pgadmin4/azure'
		UPGRADE_CHECK_ENABLED = False
		EOF
#		${EPYTHON} setup.py install
	fi
	python_optimize "${D}${APP_DIR}"

	if use client ; then
		insinto /etc/xdg/pgadmin
		newins - pgadmin4.conf <<-EOF
			[General]
			ApplicationPath=${APP_DIR}
			PythonPath=$(python_get_sitedir)
		EOF
	fi

	if use doc; then
		rm -r docs/en_US/_build/html/_sources || die
		insinto /usr/share/${PN}/docs/en_US/_build
		doins -r docs/en_US/_build/html
	fi

	if use client ; then
		local s
		for s in 16 32 48 64 72 96 128 192 256; do
			convert runtime/pgAdmin4.png -resize ${s}x${s} ${PN}_${s}.png || die
			newicon -s ${s} ${PN}_${s}.png ${PN}.png
		done
		domenu "${FILESDIR}"/${PN}.desktop
	fi
}

pkg_postinst() {
	if use server; then
	elog "You will need to setup your SQLite database by going to the /usr/share/pgadmin4/web/"
	elog "and running python setup.py."
	elog "The default path of the Database and Storage is /var/lib/pgadmin4."
	elog "You can change that, by editing the config_local.py BEFORE running"
	elog "python setup.py ."
	elog ""
	elog "You also need to change owner of the folder to your webserver uid and gid."
	elog "e.g. chown -R apache:apache /var/lib/pgadmin4/"
	elog "Also for the logfile /var/log/pgadmin4/pgadmin4.log"
	elog ""
	elog "For configuring your apache or nginx, go to"
	elog "https://www.pgadmin.org/docs/pgadmin4/development/server_deployment.html"
	elog ""
	fi
}
