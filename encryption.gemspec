lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'encryption'
  spec.version = '0.1.0'
  spec.authors = ['Matt Briggs']
  spec.email = ['matt@mattbriggs.ca']
  spec.summary = 'encryption'
  spec.description = 'encrypt/decrypt using libsodium'
  spec.homepage = 'http://mbriggs.io'
  spec.metadata['allowed_push_host'] = 'http://https://rubygems.pkg.github.com/mbriggs'
  spec.files = Dir.glob('{lib}/**/*')
  spec.require_paths = ['lib']
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.4'

  spec.add_runtime_dependency 'rbnacl', '5.0.0'
  spec.add_runtime_dependency 'evt-log'
  spec.add_runtime_dependency 'evt-clock'
  spec.add_runtime_dependency 'evt-configure'
  spec.add_runtime_dependency 'evt-dependency'
  spec.add_runtime_dependency 'evt-initializer'
  spec.add_runtime_dependency 'evt-settings'
  spec.add_runtime_dependency 'evt-schema'

  spec.add_development_dependency 'test_bench'
  spec.add_development_dependency 'bundler'
end
