# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

TYPESHED_VERSION="6cf97b8db203871568e7e66492fc2499191495f8"

DESCRIPTION="Optional static typing for Python"
HOMEPAGE="http://www.mypy-lang.org/"
SRC_URI="https://github.com/python/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/python/typeshed/archive/${TYPESHED_VERSION}.tar.gz -> ${PN}-typeshed-${TYPESHED_VERSION:0:7}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	$(python_gen_cond_dep '!dev-python/typing[${PYTHON_USEDEP}]' 'python3_4')
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/typed-ast[${PYTHON_USEDEP}]
"

src_prepare() {
	rmdir "${WORKDIR}/${P}/typeshed" || die
	mv "${WORKDIR}/typeshed-${TYPESHED_VERSION}" "${WORKDIR}/${P}/typeshed" || die

	distutils-r1_src_prepare
}

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	local PYTHONPATH="$(pwd)"

	"${PYTHON}" runtests.py || die "tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )

	distutils-r1_python_install_all
}
