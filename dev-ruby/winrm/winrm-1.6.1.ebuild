# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
#RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Ruby library for Windows Remote Management"
HOMEPAGE="http://rubygems.org/gems/winrm"

LICENSE="Apache-2.0"
SLOT="1.3"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/gssapi-1.2
	<dev-ruby/gssapi-2.0
	<dev-ruby/gyoku-2.0
	<dev-ruby/httpclient-3
	<dev-ruby/logging-3
	<dev-ruby/nori-3
	<dev-ruby/rubyntlm-0.5
"
