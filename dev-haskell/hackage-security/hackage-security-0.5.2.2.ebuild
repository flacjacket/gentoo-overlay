# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Hackage security library"
HOMEPAGE="https://github.com/well-typed/hackage-security"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+use-network-uri"

RDEPEND=">=dev-haskell/base16-bytestring-0.1.1:=[profile?] <dev-haskell/base16-bytestring-0.2:=[profile?]
	>=dev-haskell/base64-bytestring-1.0:=[profile?] <dev-haskell/base64-bytestring-1.1:=[profile?]
	>=dev-haskell/cabal-1.14:=[profile?] <dev-haskell/cabal-2.4:=[profile?]
	>=dev-haskell/cryptohash-sha256-0.11:=[profile?] <dev-haskell/cryptohash-sha256-0.12:=[profile?]
	>=dev-haskell/ed25519-0.0:=[profile?] <dev-haskell/ed25519-0.1:=[profile?]
	>=dev-haskell/mtl-2.2:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/parsec-3.1:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-haskell/tar-0.5:=[profile?] <dev-haskell/tar-0.6:=[profile?]
	>=dev-haskell/zlib-0.5:=[profile?] <dev-haskell/zlib-0.7:=[profile?]
	>=dev-lang/ghc-7.10.1:=
	use-network-uri? ( >=dev-haskell/network-2.6:=[profile?] <dev-haskell/network-2.7:=[profile?]
				>=dev-haskell/network-uri-2.6:=[profile?] <dev-haskell/network-uri-2.7:=[profile?] )
	!use-network-uri? ( >=dev-haskell/network-2.5:=[profile?] <dev-haskell/network-2.6:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
	test? ( <dev-haskell/cabal-1.25
		dev-haskell/hunit
		dev-haskell/quickcheck
		dev-haskell/tasty
		dev-haskell/tasty-hunit
		dev-haskell/tasty-quickcheck
		dev-haskell/temporary
		!use-network-uri? ( dev-haskell/network-uri ) )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag use-network-uri use-network-uri)
}
