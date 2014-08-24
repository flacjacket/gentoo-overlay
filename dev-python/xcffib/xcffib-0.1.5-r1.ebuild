# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="A drop-in replacement for xpyb based on cffi"
HOMEPAGE="https://github.com/tych0/xcffib"
SRC_URI="https://github.com/tych0/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="${PYTHON_DEPS}
dev-python/cffi[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-lang/ghc
dev-haskell/alex
dev-haskell/attoparsec
dev-haskell/cabal-install
dev-haskell/filemanip
dev-haskell/happy
>=dev-haskell/language-python-0.4.0
>=dev-haskell/mtl-2.1
>=dev-haskell/optparse-applicative-0.5
dev-haskell/split
>=dev-haskell/xcb-types-0.7.0
dev-python/autopep8
sys-process/parallel
test? ( dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-haskell/test-framework-hunit )
"

PATCHES=( "${FILESDIR}"/${P}-hackage-xcb-types.patch )

src_configure() {
	distutils-r1_python_configure

	if use test; then
		cabal configure --enable-tests
	else
		cabal configure
	fi
}

src_compile() {
	emake xcffib
}

src_test() {
	emake test
}
