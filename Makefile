.PHONY: test
.DEFAULT_GOAL := default
default: clean test build push clean

build:
	gem build encryption.gemspec

push:
	gem push --key github --host https://rubygems.pkg.github.com/mbriggs encryption-*.gem

clean:
	rm -f encryption-*.gem

test:
	ruby test/automated.rb
