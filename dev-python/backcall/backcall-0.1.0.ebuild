# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_6 )
inherit distutils-r1

DESCRIPTION="Specifications for callback functions passed in to an API"
HOMEPAGE="https://github.com/takluyver/backcall"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
