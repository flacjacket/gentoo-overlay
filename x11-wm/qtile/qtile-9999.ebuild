# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1 virtualx

if [[ ${PV} == 9999* ]] ; then
	EGIT_REPO_URI="https://github.com/qtile/qtile.git"
	inherit git-r3
else
	SRC_URI="https://github.com/qtile/qtile/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A full-featured, hackable tiling window manager written in Python"
HOMEPAGE="http://qtile.org/"

LICENSE="MIT"
SLOT="0"
IUSE="test"
# docs require sphinxcontrib-blockdiag and sphinxcontrib-seqdiag

RDEPEND="
	x11-libs/cairo[xcb]
	x11-libs/pango
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/cairocffi-0.7:=[${PYTHON_USEDEP}]
	>=dev-python/six-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/xcffib-0.3.2:=[${PYTHON_USEDEP}]
	dev-python/cffi:=[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		x11-base/xorg-server[kdrive]
	)
"

RESTRICT="test"

python_test() {
	VIRTUALX_COMMAND="nosetests" virtualmake
}

python_install_all() {
	local DOCS=( CHANGELOG README.rst )
	distutils-r1_python_install_all

	insinto /usr/share/xsessions
	doins resources/qtile.desktop

	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}"/${PN}-session ${PN}
}
