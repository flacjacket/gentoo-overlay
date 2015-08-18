# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Traitlets Python config system"
HOMEPAGE="http://ipython.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/ipython_genutils[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
