# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Open source version of the STMicroelectronics Stlink Tools"
HOMEPAGE="https://github.com/texane/stlink"
SRC_URI="https://github.com/texane/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND="
	virtual/libusb:1
	gtk? ( x11-libs/gtk+:3 )
"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh
	econf $(usex gtk --with-gtk)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README TODO

	insinto /lib/udev/rules.d
	doins 49-stlinkv1.rules
	doins 49-stlinkv2.rules
	doins 49-stlinkv2-1.rules
}
