# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_EXTRADOC="CHANGELOG.md CONTRIBUTING.md README.md LICENSE.txt"
RUBY_FAKEGEM_EXTRAINSTALL="assets logo relnotes"

RUBY_FAKEGEM_GEMSPEC="rubocop.gemspec"

inherit ruby-fakegem eutils

DESCRIPTION="A Ruby static code analyzer, based on the community Ruby style guide."
HOMEPAGE="http://github.com/bbatsov/rubocop"
SRC_URI="https://github.com/bbatsov/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_rdepend "
	>=dev-ruby/rainbow-2.0.0
	>=dev-ruby/parser-2.2.2.6
	>=dev-ruby/powerpack-0.1
	>=dev-ruby/astrolabe-1.3.1
	>=dev-ruby/ruby-progressbar-1.4.2"

ruby_add_bdepend "
	>=dev-ruby/rake-10.3.2
	>=dev-ruby/rspec-3.2.0
	>=dev-ruby/yard-0.8.7.3
	>=dev-ruby/bundler-1.7.13
	>=dev-ruby/simplecov-0.9.1"
