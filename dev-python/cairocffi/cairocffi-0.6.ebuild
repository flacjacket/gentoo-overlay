# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/cairocffi/cairocffi-0.6.0.ebuild,v 1.1 2014/05/30 04:07:25 idella4 Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="CFFI-based drop-in replacement for Pycairo"
HOMEPAGE="https://github.com/SimonSapin/cairocffi"
MY_P="${PN}-${PV}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test +xcb"

RDEPEND=">=dev-python/cffi-0.6:=[${PYTHON_USEDEP}]
	x11-libs/cairo:0=
	xcb? ( dev-python/xcffib[${PYTHON_USEDEP}] )"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/mapping.patch )

python_compile_all() {
	use doc && esetup.py build_sphinx
}

python_test() {
	py.test ${PN}/ || die "testsuite failed under ${EPYTHON}"
}

python_install_all() {
	use doc && HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
