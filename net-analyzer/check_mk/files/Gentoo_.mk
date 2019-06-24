DISTRO_CODE     = rolling
BUILD_PACKAGES	=
OS_PACKAGES     =
OS_PACKAGES    += vixie-cron # needed for sites cron jobs
OS_PACKAGES    += sys-process/time # needed for mk-job
OS_PACKAGES    += traceroute # needed for Check_MK parent scan
OS_PACKAGES    += curl
OS_PACKAGES    += dialog
OS_PACKAGES    += bind-tools
OS_PACKAGES    += fping
OS_PACKAGES    += media-gfx/graphviz
OS_PACKAGES    += apache
#OS_PACKAGES    += apache2-utils # contains htpasswd2
OS_PACKAGES    += libdbi
OS_PACKAGES    += libevent
OS_PACKAGES    += libltdl
OS_PACKAGES    += dev-perl/Net-SNMP
OS_PACKAGES    += dev-perl/Pango
#OS_PACKAGES    += libperl5.26
OS_PACKAGES    += readline:5
OS_PACKAGES    += net-analyzer/net-snmp # [perl]
OS_PACKAGES    += sys-apps/util-linux
OS_PACKAGES    += libxml2
OS_PACKAGES    += dev-php/pear
OS_PACKAGES    += pyro
OS_PACKAGES    += rsync
OS_PACKAGES    += samba
OS_PACKAGES    += rpcbind # otherwise missing path in util.pm
OS_PACKAGES    += unzip
OS_PACKAGES    += xinetd
OS_PACKAGES    += freeradius
#
# Check_MK build specific packages below
#
OS_PACKAGES    += libpcap # needed for cmc
OS_PACKAGES    += rpm # needed by msitools/Agent Bakery
OS_PACKAGES    += binutils # needed by msitools/Agent Bakery
OS_PACKAGES    += lcab # needed for creating MSI packages
OS_PACKAGES    += gnome-extra/libgsf # needed by msitools/Agent Bakery
OS_PACKAGES    += glib # needed by msitools/Agent Bakery
OS_PACKAGES    += cpio # needed for Agent bakery (solaris pkgs)
OS_PACKAGES    += sys-devel/flex # needed by heirloom-pkgtools
OS_PACKAGES    += app-text/poppler # [utils] needed for preview of PDF in reporting
OS_PACKAGES     += libffi # needed for pyOpenSSL and dependant
USERADD_OPTIONS   =
ADD_USER_TO_GROUP = gpasswd -a %(user)s %(group)s
PACKAGE_INSTALL   = emerge -auv world ; emerge -av
ACTIVATE_INITSCRIPT = init.d %s defaults
APACHE_CONF_DIR   = /etc/apache2/modules.d
APACHE_INIT_NAME  = apache2
APACHE_USER       = apache
APACHE_GROUP      = apache
APACHE_BIN        = /usr/sbin/apache2
APACHE_CTL        = /usr/sbin/apache2ctl
APACHE_MODULE_DIR = /usr/lib/apache2/modules
APACHE_MODULE_DIR_64 = /usr/lib/apache2/modules
HTPASSWD_BIN      = /usr/bin/htpasswd
APACHE_ENMOD      = a2enmod %s
PHP_FCGI_BIN      = /usr/bin/php-cgi
BECOME_ROOT       =
ARCH              = $(shell dpkg --print-architecture)
MOUNT_OPTIONS     =
INIT_CMD          = /etc/init.d/%(name)s %(action)s
