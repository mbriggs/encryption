module Encryption
  class Encrypt
    include Dependency
    include Configure

    dependency :box, Box
    dependency :clock, Clock::UTC

    configure :encrypt

    def self.build(settings = nil)
      settings ||= Settings.build("settings/encryption.json")
      key = settings.get(:secret)

      instance = new
      Box.configure(instance, key)
      Clock::UTC.configure(instance)
      instance
    end

    def self.call(data)
      build.(data)
    end

    def call(data)
      protocol = Protocol.build(data)
      protocol.timestamp = clock.iso8601

      box.encrypt(protocol)
    end
  end
end
