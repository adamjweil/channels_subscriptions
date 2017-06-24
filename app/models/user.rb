class User < ApplicationRecord
  # Associations
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password_string)
    @password = BCrypt::Password.create(password_string)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    p "*"*100
    p user
    if user.nil? == false && user.password == password
      return true
    else
      return false
    end
  end
end


=begin
  References
  1)BCrypt - Ruby
  https://github.com/codahale/bcrypt-ruby
=end
