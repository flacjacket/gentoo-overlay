# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Program a Logitech Harmony universal remote controls"
HOMEPAGE="http://phildev.net/concordance/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libconcord"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/${PN}"
