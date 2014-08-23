# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
#RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Ruby library for Windows Remote Management"
HOMEPAGE="http://rubygems.org/gems/winrm"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "
	=dev-ruby/gssapi-1.0*
	>=dev-ruby/httpclient-2.2.0.2
	=dev-ruby/httpclient-2*
	>=dev-ruby/logging-1.6.1
	=dev-ruby/logging-1*
	=dev-ruby/nokogiri-1*
	>=dev-ruby/nokogiri-1.5
	=dev-ruby/rubyntlm-0.1*
	>=dev-ruby/rubyntlm-0.1.1
	=dev-ruby/savon-0.9.5
	=dev-ruby/uuidtools-2.1*
	>=dev-ruby/uuidtools-2.1.2
"
