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

DESCRIPTION="Building Web Service Security"
HOMEPAGE="http://rubygems.org/gems/akami"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/gyoku-0.4.0
	dev-ruby/nokogiri
"

ruby_add_bdepend "
	test? (
		>=dev-ruby/mocha-0.13
		>=dev-ruby/rake-10.0
		>=dev-ruby/timecop-0.5
	)
"
