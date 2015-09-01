# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Converting Jupyter Notebooks"
HOMEPAGE="http://jupyter.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND="
	>=app-text/pandoc-1.12.1
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	dev-python/mistune[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]"
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
	)"

# Tests fail on pdflatex failure
RESTRICT="test"

python_prepare_all() {
	# Prevent un-needed download during build
	if use doc; then
		sed -e "/^    'sphinx.ext.intersphinx',/d" -i docs/source/conf.py || die
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
	use doc && HTML_DOCS=( "${S}"/docs/build/html/. )
	distutils-r1_python_install_all
}
