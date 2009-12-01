# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_charlotte20_session',
  :secret      => '040529765e9111c8d0bb4ca82d8b5952774de1cbfb94e65a56c1ea7355befab04cccf1bae2004448785fc2e1fcb16fa1d28447995f429a7acca819f7a77a5d28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
