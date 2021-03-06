# Copyright 1999-2020 Graveyard Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="test"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Add Internationalization support to your Ruby application"
HOMEPAGE="http://rails-i18n.org/"

LICENSE="MIT"
SLOT="0.6"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activesupport
	dev-ruby/mocha:1.0
	dev-ruby/test_declarative
	dev-ruby/test-unit:2 )"

each_ruby_test() {
	${RUBY} -w -Ilib -Itest test/all.rb || die
}

all_ruby_prepare() {
	#Bundler isn't really necessary here, and it doesn't work with jruby
	#Tests fail for jruby with >=mocha-0.13 unless we also include the
	#test-unit gem. jruby also requires an explicit require of 'set'.
	sed -i -e "/require 'bundler\/setup'/ s:^:#:" \
		-e '1irequire "set"' \
		-e "/require 'test\\/unit'/i gem 'test-unit'" test/test_helper.rb || die
}
