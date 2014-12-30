# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Heavy metal SOAP client"
HOMEPAGE="http://rubygems.org/gems/savon"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/akami-1.0
	<dev-ruby/akami-2
	>=dev-ruby/builder-2.1.2
	>=dev-ruby/gyoku-0.4.0
	>=dev-ruby/httpi-0.9
	<dev-ruby/httpi-1
	>=dev-ruby/nokogiri-1.4.0
	>=dev-ruby/nori-1.0
	<dev-ruby/nori-2
	<=dev-ruby/wasabi-1.0
	<dev-ruby/wasabi-2
"

ruby_add_bdepend "
	test? (
		>=dev-ruby/mocha-0.9.8
		>=dev-ruby/timecop-0.3.5
	)
"
