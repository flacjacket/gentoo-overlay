# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy{,3} )
inherit python-r1

DESCRIPTION="A virtual for the Python asyncio module"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
		$(python_gen_cond_dep 'dev-python/trollius[${PYTHON_USEDEP}]' python2_7 python3_2 pypy pypy3)
		$(python_gen_cond_dep 'dev-python/asyncio[${PYTHON_USEDEP}]' python3_3)"
