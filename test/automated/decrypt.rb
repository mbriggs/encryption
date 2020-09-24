require_relative "./automated_init"

context "Decrypt" do
  protocol = Encryption::Controls.protocol

  decrypt = Encryption::Decrypt.new
  decrypt.box.protocol = protocol

  decrypted = decrypt.(nil)

  test "decrypts" do
    assert decrypted == protocol.payload
  end
end
