# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1

DESCRIPTION="seqdiag generates sequence-diagram image from text"
HOMEPAGE="http://blockdiag.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/blockdiag[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_prepare_all() {
	sed -e '/include_package_data=True/d' -i setup.py || die

	distutils-r1_python_prepare_all
}
