require 'bcrypt'

class User < ApplicationRecord
  validates :email, presence: true, unique: true
  validates :password, presence: true
end


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
