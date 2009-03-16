# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_slimcore_session',
  :secret      => '19bbeb12e337953f3fec42b53b8a5b38299db7fcb02ed30c463d1d8a4f3b0565620f3dfa699d726a5e19fa95529727ea42ea847e4a6aa1e6b983dd503feeadc4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
