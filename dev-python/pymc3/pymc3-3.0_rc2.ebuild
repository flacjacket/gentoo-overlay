# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} )
inherit distutils-r1

MY_P=${P/_/}
DESCRIPTION="Probabilistic Programming in Python"
HOMEPAGE="https://github.com/pymc-devs/pymc3"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.zip"

S="${WORKDIR}/${MY_P}"

LICENSE="AFL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/theano-0.8.2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
