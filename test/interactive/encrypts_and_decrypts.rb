require_relative "./interactive_init"

data = Encryption::Controls.hash_data

puts "encrypting '#{data.inspect}'"
puts "-----------------"
puts "\n\n"

encrypted = Encryption::Encrypt.(data)

pp encrypted

puts "\n\n"

puts "now decrypting"

decrypted = Encryption::Decrypt.(encrypted)

puts "decrypted: #{decrypted.inspect}"
