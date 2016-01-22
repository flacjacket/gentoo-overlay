# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="Python binding to libudev"
HOMEPAGE="http://pyudev.readthedocs.org https://github.com/pyudev/pyudev"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pygobject qt4 qt5 pyside test"

RDEPEND="virtual/udev
	pygobject? ( dev-python/pygobject:2[$(python_gen_usedep 'python2*')] )
	qt4? ( dev-python/PyQt4[${PYTHON_USEDEP}] )
	qt5? ( dev-python/PyQt5[${PYTHON_USEDEP}] )
	pyside? ( dev-python/pyside[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}] )"

DOCS=( CHANGES.rst README.rst )

REQUIRED_USE="pygobject? ( || ( $(python_gen_useflags 'python2*') ) )
	pyside? ( $(python_gen_useflags '!(python3_3)') )"

python_prepare_all() {
	# tests are known to pass then fail on alternate runs
	# tests: fix run_path
	pwd
	ls
	sed -i -e "s|== \('/run/udev'\)|in (\1,'/dev/.udev')|g" \
		tests/test_core.py || die

	if ! use pygobject; then
		rm src/pyudev/glib.py || die
		sed -i -e "s|[, ]*GlibBinding()||g" \
			tests/test_observer.py || die
	fi
	if ! use qt4; then
		rm src/pyudev/pyqt4.py || die
		sed -i -e "s|Qt4Binding('PyQt4')[, ]*||g" \
			tests/test_observer.py || die
	fi
	if ! use qt5; then
		rm src/pyudev/pyqt5.py || die
		sed -i -e "s|Qt4Binding('PyQt5')[, ]*||g" \
			tests/test_observer.py || die
	fi
	if ! use pyside; then
		rm src/pyudev/pyside.py || die
		sed -i -e "s|Qt4Binding('PySide')[, ]*||g" \
			tests/test_observer.py || die
	fi
	if ! use qt4 && ! use qt5 && ! use pyside; then
		rm src/pyudev/_qt_base.py || die
	fi
	if ! use qt4 && ! use qt5 && ! use pyside && ! use pygobject; then
		rm tests/test_observer.py || die
	fi

	ewarn "If your PORTAGE_TMPDIR is longer in length then '/var/tmp/',"
	ewarn "change it to /var/tmp to ensure tests will pass."

	distutils-r1_python_prepare_all
}

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}
