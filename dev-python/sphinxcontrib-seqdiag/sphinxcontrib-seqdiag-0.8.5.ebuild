# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy)

inherit distutils-r1

DESCRIPTION="Sphinx seqdiag extension"
HOMEPAGE="http://github.com/blockdiag/sphinxcontrib-seqdiag"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	>=dev-python/blockdiag-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/seqdiag-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/sphinx-0.6[${PYTHON_USEDEP}]"
