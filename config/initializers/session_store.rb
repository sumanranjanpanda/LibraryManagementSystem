# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LibraryManagement_session',
  :secret      => '46b2597b312942576540e23331088fd67c45635810deeadc75955aef4adbe9c3ecb57c2c2bd0dcdfb34a6a63e514fb5e9563295e853806c1985e5458735b6ff8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
