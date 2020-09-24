module Encryption
  class Decrypt
    include Dependency
    include Configure

    dependency :box, Box

    configure :decrypt

    def self.build(settings = nil)
      settings ||= Settings.build("settings/encryption.json")
      key = settings.get(:secret)

      instance = new
      Box.configure(instance, key)
      instance
    end

    def self.call(data)
      build.(data)
    end

    def call(data)
      decrypted = box.decrypt(data)
      protocol = Protocol.deserialize(decrypted)

      protocol.payload
    end
  end
end
