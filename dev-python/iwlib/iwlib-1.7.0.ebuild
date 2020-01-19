# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )
inherit distutils-r1

MY_PN="python-iwlib"

DESCRIPTION="iwlib library for Python, for interacting with wireless devices"
HOMEPAGE="https://github.com/nhoad/python-iwlib"

if [[ ${PV} == 9999* ]] ; then
	EGIT_REPO_URI="https://github.com/nhoad/${MY_PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/nhoad/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python-cffi[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
