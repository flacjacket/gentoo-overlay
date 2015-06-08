# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/cairocffi/cairocffi-0.6-r1.ebuild,v 1.1 2015/05/06 03:22:24 idella4 Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="CFFI-based drop-in replacement for Pycairo"
MY_PN="${PN}"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
HOMEPAGE="https://github.com/SimonSapin/cairocffi"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

# xcffib is an optional extra excpet that the testsuite has it a hard coded unconditional component
RDEPEND="${PYTHON_DEPS}
$(python_gen_cond_dep '>=dev-python/cffi-1.1.0:=[${PYTHON_USEDEP}]' 'python*')
$(python_gen_cond_dep 'virtual/pypy' pypy)
$(python_gen_cond_dep 'virtual/pypy3' pypy3)
x11-libs/cairo:0=
>=dev-python/xcffib-0.3.0[${PYTHON_USEDEP}]
x11-libs/gdk-pixbuf[jpeg]"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( ${RDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}] )"

# Intersphinx cause the usual d'loading of objects.inv from TWO online sites
PATCHES=( "${FILESDIR}"/mapping.patch )

S="${WORKDIR}/${MY_P}"

python_compile_all() {
	use doc && esetup.py build_sphinx
}

python_test() {
	https://github.com/SimonSapin/cairocffi/issues/55
	py.test ${PN}/ || die "testsuite failed under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
