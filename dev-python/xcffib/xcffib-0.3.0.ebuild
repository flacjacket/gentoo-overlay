# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="A drop-in replacement for xpyb based on cffi"
HOMEPAGE="https://github.com/tych0/xcffib"
SRC_URI="https://github.com/tych0/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="${PYTHON_DEPS}
>=dev-haskell/xcffibgen-${PV}:=
$(python_gen_cond_dep '>=dev-python/cffi-1.1.0:=[${PYTHON_USEDEP}]' 'python*')
$(python_gen_cond_dep 'virtual/pypy' pypy)
$(python_gen_cond_dep 'virtual/pypy3' pypy3)
dev-python/six[${PYTHON_USEDEP}]
x11-proto/xcb-proto:="
DEPEND="${RDEPEND}
sys-process/parallel
test? ( dev-python/nose[${PYTHON_USEDEP}] )
"

PATCHES=( "${FILESDIR}"/${PN}-separate-haskell-package.patch )

python_prepare() {
	emake xcffib
}
