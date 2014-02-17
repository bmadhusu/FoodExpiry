# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

FoodExpiry::Application.config.secret_key_base = secure_token

#FoodExpiry::Application.config.secret_token = '446feb779177c82c258c43bf2166047dbb80d3cfaece4c0ae76cea88b5f697d34e9a4bef0e0c853d1f5fc6669ee40b8f2bcc791993d665f496d2c91019523dd1'
