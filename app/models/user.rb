class User < ApplicationRecord
  # Associations
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  validate :password_length

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

  def password_length
    if @password_string.length == 0
      errors.add(:password_length, "does not meet length requirements")
    end
  end
end


=begin
  References
  1) BCrypt - Ruby
  https://github.com/codahale/bcrypt-ruby
  2) guides.rubyonrails.org on "Active Record Validations"
  http://guides.rubyonrails.org/active_record_validations.html
=end
