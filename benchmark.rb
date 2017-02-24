require 'benchmark/ips'
require 'active_support'

N = 10_000
BASE_SECRET = '6df604f5ad2caa8f0c9d4819e5c67f59aef0908bf18a2f1cf7c759681b5b3ebd385094f6812d0a56aba82be362683e355fc632c68a9ef7b30af7f79aaf8ec516'

key_gen = ActiveSupport::KeyGenerator.new(BASE_SECRET, iterations: 2)
message = Marshal.dump(session_id: '0f2cbc872d465a2924eb6ca46ad07e67', _csrf_token: 'hN37thEmzXiLVfb69kpln6IfSBpG7Bk18TTPK5BwBxs=')

cipher_hmac_cbc = 'aes-256-cbc'
cipher_gcm = 'aes-256-gcm'

# salts and secrets for HMAC CBC
enc_salt  = 'enc salt'
sign_salt = 'sign salt'

enc_secret  = key_gen.generate_key(enc_salt)
sign_secret = key_gen.generate_key(sign_salt)

# salts and secrets for GCM
gcm_salt = 'gcm salt'
gcm_secret = key_gen.generate_key(gcm_salt)

# initialize a verifier
verifier = ActiveSupport::MessageVerifier.new(
  key_gen.generate_key('salt'),
  serializer: ActiveSupport::MessageEncryptor::NullSerializer)

# predefine a signed message
signed_message = verifier.generate(message)

# initialize encryptors
encryptor_hmac_cbc = ActiveSupport::MessageEncryptor.new(
  enc_secret[0, ActiveSupport::MessageEncryptor.key_len(cipher_hmac_cbc)],
  sign_secret,
  digest: 'SHA1',
  cipher: cipher_hmac_cbc,
  serializer: ActiveSupport::MessageEncryptor::NullSerializer)

encryptor_gcm = ActiveSupport::MessageEncryptor.new(
  gcm_secret[0, ActiveSupport::MessageEncryptor.key_len(cipher_gcm)],
  cipher: cipher_gcm,
  serializer: ActiveSupport::MessageEncryptor::NullSerializer)

# predefine some ciphertexts
ct_hmac_cbc = encryptor_hmac_cbc.encrypt_and_sign(message)
ct_gcm = encryptor_gcm.encrypt_and_sign(message)

puts "Size of HMAC signed message: #{signed_message.size}"
puts "Size of HMAC CBC ciphertext: #{ct_hmac_cbc.size}"
puts "Size of GCM ciphertext: #{ct_gcm.size}"
puts "\n"

Benchmark.ips do |x|
  x.report('HMAC generate') do
    N.times do
      verifier.generate(message)
    end
  end

  x.report('HMAC verify') do
    N.times do
      verifier.verify(signed_message)
    end
  end

  x.report('HMAC-CBC encrypt_and_sign') do
    N.times do
      encryptor_hmac_cbc.encrypt_and_sign(message)
    end
  end

  x.report('HMAC-CBC decrypt_and_verify') do
    N.times do
      encryptor_hmac_cbc.decrypt_and_verify(ct_hmac_cbc)
    end
  end

  x.report('GCM encrypt_and_sign') do
    N.times do
      encryptor_gcm.encrypt_and_sign(message)
    end
  end

  x.report('GCM decrypt_and_verify') do
    N.times do
      encryptor_gcm.decrypt_and_verify(ct_gcm)
    end
  end
end
