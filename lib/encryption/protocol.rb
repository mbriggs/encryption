module Encryption
  class Protocol
    include Schema::DataStructure

    attribute :payload
    attribute :timestamp, String

    def self.build(data)
      instance = new

      case data
      when String
        instance.payload = data
      when Hash
        instance.payload = JSON.pretty_generate(data)
      else
        raise "only strings and hashes are currently supported for encryption"
      end

      instance
    end

    def self.deserialize(serialized)
      parsed = JSON.parse(serialized, symbolize_names: true)

      instance = new

      parsed_payload = parsed.fetch(:payload)
      if valid_json?(parsed_payload)
        instance.payload = JSON.parse(parsed_payload, symbolize_names: true)
      else
        instance.payload = parsed_payload
      end

      instance.timestamp = parsed.fetch(:timestamp)

      instance
    end

    def self.valid_json?(json)
      JSON.parse(json)
      true
    rescue JSON::ParserError
      false
    end

    def serialize
      JSON.pretty_generate(to_h)
    end
  end
end
