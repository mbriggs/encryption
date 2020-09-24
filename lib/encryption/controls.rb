module Encryption
  module Controls
    def self.key
      "jcPFur4gwMqqv2zOfU8o7S71/OGVZm7Y2Igh4a7ZtTo="
    end

    def self.protocol
      protocol = Protocol.build(string_data)
      protocol.timestamp = timestamp
      protocol
    end

    def self.timestamp
      Clock::UTC.iso8601(time)
    end

    def self.time
      @time ||= Time.now
    end

    def self.string_data
      "this is some test data"
    end

    def self.hash_data
      { data: string_data }
    end
  end
end
