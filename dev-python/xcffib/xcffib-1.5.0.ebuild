# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} pypy3_11 )
DISTUTILS_USE_PEP517=setuptools
CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"

inherit haskell-cabal distutils-r1

DESCRIPTION="A drop-in replacement for xpyb based on cffi"
HOMEPAGE="https://github.com/tych0/xcffib"
SRC_URI="https://github.com/tych0/${PN}/archive/v${PV}.tar.gz -> ${PN}-full-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/either:=[profile?]
	dev-haskell/filemanip:=[profile?]
	>=dev-haskell/language-python-0.5.6:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?]
	>=dev-haskell/optparse-applicative-0.13:=[profile?]
	dev-haskell/split:=[profile?]
	>=dev-haskell/xcb-types-0.13.0:=[profile?]
	>=dev-lang/ghc-7.6.1:=
	dev-python/six[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/cffi-1.1:=[${PYTHON_USEDEP}]' 'python*')
	x11-base/xcb-proto
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	test? (
		dev-haskell/hunit
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		x11-base/xorg-server[xvfb]
		x11-apps/xeyes
	)
"

distutils_enable_tests pytest

src_prepare() {
	cabal-mksetup

	eapply "${FILESDIR}"/${PN}-nocabal.patch
	eapply_user
}

src_configure() {
	haskell-cabal_src_configure
}

src_compile() {
	# first, we have to build the generator
	haskell-cabal_src_compile

	# now, we can prepare, configure, and compile the python module
	distutils-r1_src_prepare
	distutils-r1_src_configure
	distutils-r1_src_compile
}

src_install() {
	haskell-cabal_src_install
	distutils-r1_src_install

	einstalldocs
}

python_prepare_all() {
	emake xcffib ver=${PV}

	distutils-r1_python_prepare_all
}
