# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.3

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit base haskell-cabal

DESCRIPTION="A cffi-based python binding for X"
HOMEPAGE="http://github.com/tych0/xcffib"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/attoparsec:=[profile?]
	dev-haskell/filemanip:=[profile?]
	>=dev-haskell/language-python-0.4.0:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?]
	>=dev-haskell/optparse-applicative-0.5:=[profile?]
	dev-haskell/split:=[profile?]
	>=dev-haskell/xcb-types-0.7.0:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	test? ( dev-haskell/hunit
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit )
"

PATCHES=( "${FILESDIR}"/${P}-hackage-xcb-types.patch "${FILESDIR}"/${P}-setup.lhs.patch )
