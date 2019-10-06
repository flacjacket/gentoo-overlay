# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Configuration tool for the Betaflight firmware"
HOMEPAGE="https://github.com/betaflight/betaflight-configurator"
SRC_URI="https://github.com/betaflight/betaflight-configurator/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
sys-apps/yarn"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	yarn install || die
	yarn gulp apps --linux64 || die
}

src_install() {
	insinto /usr/share/${PN}
	doins -r apps/betaflight-configurator/linux64/*

	mkdir "${D}"/usr/bin/ || die
	ln -s /usr/share/${PN}/betaflight-configurator "${D}"/usr/bin/betaflight-configurator || die
}
