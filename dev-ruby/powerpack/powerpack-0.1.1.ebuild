# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_EXTRADOC="README.md LICENSE.txt"
RUBY_FAKEGEM_EXTRAINSTALL=""

RUBY_FAKEGEM_GEMSPEC="powerpack.gemspec"

inherit ruby-fakegem eutils

DESCRIPTION="Some useful extensions to the core Ruby classes"
HOMEPAGE="https://github.com/bbatsov/powerpack"
SRC_URI="https://github.com/bbatsov/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_bdepend "
	>=dev-ruby/bundler-1.7.13
	>=dev-ruby/rake-0.9.6
	>=dev-ruby/rspec-2.14.0
	>=dev-ruby/yard-0.8.7.3"
