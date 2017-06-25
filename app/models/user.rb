class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  has_many :subcriptions, foreign_key: :user_id
  has_many :channels, through: :subscriptions

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user ||= User.find_by_email(email)
    @user != nil && @user.password == password ? @user : nil
  end
end
