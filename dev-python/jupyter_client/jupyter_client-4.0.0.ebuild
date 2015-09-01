# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Jupyter protocol implementation and client libraries"
HOMEPAGE="http://jupyter.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND="
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-13[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]"
DEPEND="
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
	)"

python_prepare_all() {
	# Prevent un-needed download during build
	if use doc; then
		sed -e "/^    'sphinx.ext.intersphinx',/d" -i docs/conf.py || die
	fi

	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	nosetests -d -v || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( "${S}"/docs/_build/html/. )
	distutils-r1_python_install_all
}
