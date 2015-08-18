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
IUSE="test"

RDEPEND="
	dev-libs/mathjax
	dev-python/ipykernel[${PYTHON_USEDEP}]
	dev-python/ipython_genutils[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/jupyter_client[${PYTHON_USEDEP}]
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	dev-python/nbconvert[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	>=www-servers/tornado-4.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/ipython_genutils[${PYTHON_USEDEP}]' python2_7)"
DEPEND="${RDEPEND}
	test? (
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7)
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)"

PATCHES=(
	"${FILESDIR}"/${P}-no-entrypoints.patch
)

python_prepare_all() {
	# disable bundled mathjax
	sed -i 's/^.*MathJax.*$//' bower.json
	sed -i 's/mj(/#mj(/' setupbase.py

	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install

	ln -sf "${EPREFIX}/usr/share/mathjax" "${D}$(python_get_sitedir)/notebook/static/components/MathJax"
}
