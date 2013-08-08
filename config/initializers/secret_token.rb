# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Storm::Application.config.secret_key_base = 'bb20441adade8cf3280f296d4f6fd0824bf3602c69a05d034dc0026af2e5c15f3669ee92a531dadf06bcd68bc5d97d8a94ac3537ccd86e09a0aa8483a631699b'
