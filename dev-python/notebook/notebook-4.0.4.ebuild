# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1

DESCRIPTION="Jupyter Notebook"
HOMEPAGE="http://jupyter.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

RDEPEND="
	dev-libs/mathjax
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/ipython_genutils[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/jupyter_client[${PYTHON_USEDEP}]
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	dev-python/nbconvert[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/terminado[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	>=www-servers/tornado-4.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/ipython_genutils[${PYTHON_USEDEP}]' python2_7)"
DEPEND="
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? (
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7)
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)"

PATCHES=(
	"${FILESDIR}"/${PN}-no-entrypoints.patch
)

python_prepare_all() {
	# disable bundled mathjax
	sed -i 's/^.*MathJax.*$//' bower.json
	sed -i 's/mj(/#mj(/' setupbase.py

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

python_install() {
	distutils-r1_python_install

	ln -sf "${EPREFIX}/usr/share/mathjax" "${D}$(python_get_sitedir)/notebook/static/components/MathJax"
}

python_install_all() {
	use doc && HTML_DOCS=( "${S}"/docs/build/html/. )
	distutils-r1_python_install_all
}
