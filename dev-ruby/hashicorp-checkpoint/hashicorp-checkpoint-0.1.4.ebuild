# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_GEMSPEC="ruby-checkpoint.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Internal HashiCorp service to check version information"
HOMEPAGE="http://www.hashicorp.com/"

LICENSE="MPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "
	test? ( >=dev-ruby/rake-10.0 )
"
