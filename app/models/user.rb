class User < ApplicationRecord
  # Remember to create a migration!
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :subscriptions
  has_many :channels, through: :subscriptions

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password_given)
    user_to_check = User.find_by(email: email)
    if user_to_check
      user_to_check.password == password_given
    else
      false
    end
  end
end
