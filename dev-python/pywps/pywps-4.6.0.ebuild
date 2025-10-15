# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="PyWPS is an implementation of the Web Processing Service standard from the Open Geospatial Consortium."
HOMEPAGE="https://pywps.org/ https://github.com/geopython/pywps https://pypi.org/project/pywps"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="app-arch/gzip"
DEPEND="dev-python/markupsafe
	dev-python/sqlalchemy
	sci-libs/Fiona
	sci-libs/libgeotiff
	<=dev-python/tifffile-2025.5.10
	<=dev-python/zarr-3
	dev-python/humanize
	dev-python/jinja2
	dev-python/jsonschema
	dev-python/lxml
	dev-python/owslib
	dev-python/python-dateutil
	dev-python/requests
	dev-python/werkzeug
	dev-python/urllib3
	dev-python/numpy
	"
