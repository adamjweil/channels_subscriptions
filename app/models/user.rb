class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :subscription
  has_many :channels
  include BCrypt

  def self.authenticate(login_credentials)
      user = User.find_by(email: login_credentials[:email])
      if user
        user.password == login_credentials[:password]
      else
        false
      end
    end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
end
