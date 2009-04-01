# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_remotelogger-server_session',
  :secret      => 'b1216823238e1883d49fa246d05bfc9d27c8606ce322c03f6cbd325f7a4c4829b9392c2f935ad10d99fc96eafbda4b7d32258665011e5af8c8eaeef27ed5f457'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
