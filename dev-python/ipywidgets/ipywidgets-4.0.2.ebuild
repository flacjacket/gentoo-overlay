# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="IPython HTML widgets for Jupyter"
HOMEPAGE="http://ipython.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/ipython-4.0.0[${PYTHON_USEDEP}]
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	dev-python/notebook[${PYTHON_USEDEP}]"
DEPEND="
	test? (
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7)
		dev-python/nose[${PYTHON_USEDEP}]
	)"

python_test() {
	# JS tests require casperjs, just run Python tests
	nosetests -d -v || die "Tests fail with ${EPYTHON}"
}
