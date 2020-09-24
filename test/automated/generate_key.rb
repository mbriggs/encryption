require_relative "./automated_init"

context "Generate key" do
  key = Encryption.generate_key

  test "key is generated" do
    assert key.is_a? String
  end

  test "key is base64 encoded" do
    decoded = Base64.decode64(key)

    assert decoded.length == 32
  end
end
