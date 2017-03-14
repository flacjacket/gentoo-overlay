# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A primitive drawing library targeted at Wayland"
HOMEPAGE="https://github.com/michaelforney/wld"
EGIT_REPO_URI="https://github.com/michaelforney/wld.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

VIDEO_CARDS="intel nouveau"
for card in ${VIDEO_CARDS}; do
	IUSE_VIDEO_CARDS+=" video_cards_${card}"
done

IUSE="${IUSE_VIDEO_CARDS}"

DEPEND="x11-libs/pixman"
for card in ${VIDEO_CARDS}; do
	DEPEND="${DEPEND}
		x11-libs/libdrm[video_cards_${card}?]
	"
done

RDEPEND="${DEPEND}"

src_configure() {
	for card in ${VIDEO_CARDS}; do
		if use video_cards_${card}; then
			DRIVERS+=" ${card}"
		fi
	done

	sed -e "/ENABLE_DEBUG/s:1:0:" \
		-e "/ENABLE_STATIC/s:1:0:" \
		-e "/CFLAGS/s:-pipe:${CFLAGS}:" \
		-e "/DRM_DRIVERS/s: intel nouveau:${DRIVERS}:" \
		-i config.mk || die
}

src_install() {
	emake PREFIX="${ED}/usr" install
}
