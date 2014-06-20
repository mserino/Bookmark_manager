require 'bcrypt'

class User
	include DataMapper::Resource


	property :id, Serial
	property :email, String, :unique => true, :message => "This email is already taken"
	property :password_digest, Text
	property :password_token, Text
	property :password_token_time, Text

	attr_reader :password
	attr_reader :password_token
	attr_reader :password_token_time
	attr_accessor :password_confirmation
	validates_confirmation_of :password, :message => "Your passwords don\'t match"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		# that's the user who is trying to sign in
		user = first(:email => email)
		# if this user exists and the password provided matches the one we have password_digest for, everything's fine.
		# The Password.new returns an object that overrides the == method. Instead of comparing two passwords directly (which is impossible because we only have a one-way hash), the == method calculates the candidate password_digest from the password given and compares it to the password_digest it was initialized with.
		# This is not a string comparison
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end