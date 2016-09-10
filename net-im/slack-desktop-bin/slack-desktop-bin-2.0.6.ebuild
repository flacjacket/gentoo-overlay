# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit unpacker eutils

DESCRIPTION="Official Slack Desktop Client"
HOMEPAGE="http://www.slack.com/"

SRC_URI_AMD64="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-amd64.deb"
SRC_URI_X86="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-i386.deb"
SRC_URI="
	amd64? ( ${SRC_URI_AMD64} )
	x86? ( ${SRC_URI_X86} )
"

LICENSE="slack"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-libs/alsa-lib
	dev-libs/expat
	gnome-base/gconf
	x11-libs/gtk+:2
	gnome-base/gvfs
	app-text/hunspell
	dev-libs/libgcrypt
	gnome-base/libgnome-keyring
	x11-libs/libnotify
	x11-libs/libXtst
	x11-misc/xdg-utils
"

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	rm -rf "${WORKDIR}"/usr/share/lintian
	rm -rf "${WORKDIR}"/usr/share/doc

	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
