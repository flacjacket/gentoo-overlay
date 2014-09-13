# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_3 )

inherit distutils-r1

DESCRIPTION="Reference implementation of PEP 3156"
HOMEPAGE="http://www.python.org/dev/peps/pep-3156/"
SRC_URI="https://pypi.python.org/packages/source/a/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"
