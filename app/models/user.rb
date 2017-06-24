class User < ApplicationRecord
  has_many :channels, through: :subscriptions
  has_many :subscriptions

  validates :first_name, :last_name, :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(passcode)
    self.password == passcode
  end

end
