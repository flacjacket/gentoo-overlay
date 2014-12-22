# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Port of the Tulip project (asyncio module, PEP 3156) on Python 2"
HOMEPAGE="https://bitbucket.org/enovance/trollius/"
SRC_URI="https://bitbucket.org/enovance/${PN}/get/${P}.tar.bz2"
S="${WORKDIR}/enovance-${PN}-cf9e7fc6660b"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"
