require 'rbnacl'
require 'base64'
require 'schema'
require 'settings'
require 'configure'
require 'dependency'
require 'settings'
require 'clock'
require 'json'

require "encryption/protocol"
require "encryption/box"
require "encryption/encrypt"
require "encryption/decrypt"

module Encryption
  def self.generate_key
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.encode64(key).chomp
  end
end
