require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  # changed password_hash to hashed_password to match migration
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(hash)
    user = User.find_by(email: hash[:email])
    return user if !!user && user.password == hash[:password]
  end
end
