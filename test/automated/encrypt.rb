require_relative "./automated_init"

context "Encrypt" do
  data = Encryption::Controls.string_data
  time = Encryption::Controls.time
  timestamp = Encryption::Controls.timestamp

  encrypt = Encryption::Encrypt.new
  encrypt.clock.now = time

  cipher = encrypt.(data)

  test "encrypts with box" do
    assert encrypt.box.encrypted == cipher
  end

  context "encrypted" do
    protocol = encrypt.box.protocol

    test "data" do
      assert protocol.payload == data
    end

    test "timestamp" do
      assert protocol.timestamp == timestamp
    end
  end
end
