.PHONY: test
.DEFAULT_GOAL := default
default: clean test build push clean

build:
	gem build mb-encryption.gemspec

push:
	gem push --key github --host https://rubygems.pkg.github.com/mbriggs mb-encryption-*.gem

clean:
	rm -f mb-encryption-*.gem

test:
	ruby test/automated.rb
