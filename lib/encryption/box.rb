module Encryption
  class Box
    include Initializer
    include Configure

    initializer :key

    configure :box

    def self.build(key)
      secret = Base64.decode64(key)
      new(secret)
    end

    def nacl
      @nacl ||= RbNaCl::SimpleBox.from_secret_key(key)
    end

    def encrypt(protocol)
      result = nacl.encrypt(protocol.serialize)
      Base64.encode64(result)
    end

    def decrypt(data)
      decoded = Base64.decode64(data)
      nacl.decrypt(decoded)
    end

    module Substitute
      def self.build
        TransparentBox.new
      end

      class TransparentBox
        attr_accessor :protocol

        def encrypted
          "encrypted"
        end

        def encrypt(data)
          @protocol = data
          encrypted
        end

        def decrypt(_)
          protocol.serialize
        end
      end
    end
  end
end
