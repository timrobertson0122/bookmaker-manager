require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, message: 'This email is already taken'

  property :password_digest, Text
  property :password_token, Text
  property :password_token_timestamp, Time

  attr_reader :password
  attr_accessor :password_confirmation

  validates_uniqueness_of :email
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def receive_password_token_email
    BookmarkManager::Application.email_handler.send_email_to self
  end

end