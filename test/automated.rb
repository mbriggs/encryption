require_relative './test_init'

require 'test_bench/cli'

TestBench::CLI.(
  exclude_file_pattern: %r{/_|sketch|(_init\.rb|_tests\.rb)\z}
)
