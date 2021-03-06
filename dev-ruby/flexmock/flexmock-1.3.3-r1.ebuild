# Copyright 1999-2020 Graveyard Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# ruby22 -> fails specs
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_DOCDIR="html"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.md doc/*.rdoc doc/releases/*"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_RECIPE_DOC="none"

inherit ruby-fakegem

DESCRIPTION="Simple mock object library for Ruby unit testing"
HOMEPAGE="https://github.com/jimweirich/flexmock"

LICENSE="flexmock"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_bdepend "
	test? (
		dev-ruby/rspec:2
	)"

each_ruby_test() {
	ruby-ng_rspec test/rspec_integration
	${RUBY} -S testrb -Ilib:. test/*_test.rb || die
}
