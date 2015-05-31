# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEFEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Common interface for Ruby's HTTP libraries."
HOMEPAGE="http://rubygems.org/gems/httpi"

LICENSE="MIT"
SLOT="0.9"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack:="

ruby_add_bdepend "
	test? (
		>=dev-ruby/mocha-0.9.9
		>=dev-ruby/webmock-1.4.0
		>=dev-ruby/zentest-4.5.0
	)
"
