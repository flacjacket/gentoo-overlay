# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )
PYTHON_REQ_USE='readline,sqlite'

inherit distutils-r1 eutils virtualx

DESCRIPTION="Advanced interactive shell for Python"
HOMEPAGE="http://ipython.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples matplotlib mongodb octave +smp test wxwidgets"

REQUIRED_USE="
	test? ( doc matplotlib mongodb )
	doc? ( mongodb )"

CDEPEND="
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/pickleshare[${PYTHON_USEDEP}]
	dev-python/pexpect[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/simplegeneric[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
	matplotlib? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	mongodb? ( <dev-python/pymongo-3[${PYTHON_USEDEP}] )
	octave? ( dev-python/oct2py[${PYTHON_USEDEP}] )
	smp? ( >=dev-python/pyzmq-13[${PYTHON_USEDEP}] )
	wxwidgets? ( $(python_gen_cond_dep 'dev-python/wxpython:*[${PYTHON_USEDEP}]' python2_7) )"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	test? (
		app-text/dvipng
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7)
		>=dev-python/nose-0.10.1[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
	)
	doc? (
		dev-python/cython[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/fabric[${PYTHON_USEDEP}]' python2_7)
		>=dev-python/jsonschema-2.0[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		>=dev-python/nose-0.10.1[${PYTHON_USEDEP}]
		dev-python/numpydoc[${PYTHON_USEDEP}]
		dev-python/rpy[${PYTHON_USEDEP}]
		>=dev-python/sphinx-1.1[${PYTHON_USEDEP}]
		>=www-servers/tornado-4.0[${PYTHON_USEDEP}]
	)"

DISTUTILS_IN_SOURCE_BUILD=1

python_prepare_all() {
	# Prevent un-needed download during build
	if use doc; then
		sed -e "/^    'sphinx.ext.intersphinx',/d" -i docs/source/conf.py || die
	fi

	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && emake -C docs html_noapi
}

python_test() {
	distutils_install_for_testing
	# https://github.com/ipython/ipython/issues/8639
	# Failure of some modules only in python3.4 
	local fail
	run_tests() {
		pushd ${TEST_DIR} > /dev/null
		"${PYTHON}" -m IPython.testing.iptestcontroller --all || fail=1
		popd > /dev/null
	}
	VIRTUALX_COMMAND=run_tests virtualmake
		[[ ${fail} ]] && die "Tests fail with ${EPYTHON}"
}

python_install() {
	distutils-r1_python_install

	# Create ipythonX.Y symlinks.
	# TODO:
	# 1. do we want them for pypy? No.  pypy has no numpy
	# 2. handle it in the eclass instead (use _python_ln_rel).
	# With pypy not an option the dosym becomes unconditional
	dosym ../lib/python-exec/${EPYTHON}/ipython \
		/usr/bin/ipython${EPYTHON#python}
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )
	use examples && local EXAMPLES=( examples/. )
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "sympyprinting" dev-python/sympy
	optfeature "cythonmagic" dev-python/cython

	elog "Since the IPython 4.0, only the IPython terminal console is"
	elog "contained in the IPython package. The various sub-components and"
	elog "frontends now fall under jupyter and can all be installed from the"
	elog "dev-python/jupyter meta-package, or each component individually:"
	elog "dev-python/nbconvert, dev-python/nbformat,"
	elog "dev-python/jupyter_console, dev-python/notebook,"
	elog "dev-python/qtconsole"
}
