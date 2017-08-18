class User < ActiveRecord::Base
    has_many :subscriptions
    has_many :channels, through: :subscriptions

    validates :email, :password, presence: true
    validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def total_price_per_month
    channels.sum(:price_per_month)
  end

end
