# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Foreign Function Interface for Python calling C code"
HOMEPAGE="http://cffi.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="doc"

RDEPEND="virtual/libffi
	dev-python/pycparser[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

python_compile_all() {
	use doc && emake -C doc html
}

python_test() {
	py.test -x -v --ignore testing/test_zintegration.py c/ testing/ || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
	use doc && dohtml -r doc/build/
}
