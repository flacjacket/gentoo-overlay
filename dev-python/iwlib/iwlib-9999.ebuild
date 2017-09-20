# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit distutils-r1

MY_PN="python-iwlib"

DESCRIPTION="iwlib library for Python, for interacting with wireless devices"
HOMEPAGE="https://github.com/nathan-hoad/python-iwlib"

if [[ ${PV} == 9999* ]] ; then
	EGIT_REPO_URI="https://github.com/nathan-hoad/${MY_PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/nathan-hoad/${MY_PN}/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python-cffi[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
