require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :channels

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

end
