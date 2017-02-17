# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.1

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Natural numbers"
HOMEPAGE="https://github.com/ekmett/nats/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+binary +hashable +template-haskell"

RDEPEND=">=dev-lang/ghc-7.4.1:=
	hashable? ( >=dev-haskell/hashable-1.1:=[profile?] <dev-haskell/hashable-1.3:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag binary binary) \
		$(cabal_flag hashable hashable) \
		$(cabal_flag template-haskell template-haskell)
}