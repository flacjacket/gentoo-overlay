# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cargo

EGIT_REPO_URI="https://github.com/jwilm/${PN}.git"
inherit git-r3

DESCRIPTION="A cross-platform, GPU-accelerated terminal emulator"
HOMEPAGE="https://github.com/jwilm/alacritty"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	media-libs/freetype
	media-libs/fontconfig
	x11-misc/xclip"
DEPEND="${RDEPEND}
	>=dev-lang/rust-1.15"
