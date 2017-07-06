class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  has_many :subscriptions
  has_many :channels, through: :subscriptions

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password_string)
    @password_string = password_string
    @password = BCrypt::Password.create(password_string)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.password == password
  end
end
