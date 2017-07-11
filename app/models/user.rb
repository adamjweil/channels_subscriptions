class User < ApplicationRecord
  # Remember to create a migration!
  has_many :channels
  has_many :channels, through: :subscriptions

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :password, presence: true

  def self.authenticate(login_credentials)
    user = User.find_by(email: login_credentials[:email])
    if user
      user.password == login_credentials[:password]
    else
      false
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
