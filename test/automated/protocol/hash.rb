require_relative "../automated_init"

context "Protocol" do
  context "Hash" do
    data = Encryption::Controls.hash_data
    timestamp = Encryption::Controls.timestamp

    protocol = Encryption::Protocol.build(data)
    protocol.timestamp = timestamp

    serialized = protocol.serialize

    test "serializes" do
      assert serialized
    end

    deserialized = Encryption::Protocol.deserialize(serialized)

    test "deserializes" do
      assert deserialized
    end

    test "data" do
      assert deserialized.payload == data
    end

    test "timestamp" do
      assert deserialized.timestamp == timestamp
    end
  end
end
