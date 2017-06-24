class User < ApplicationRecord
  validates :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
      if @user.password == password && @user.email == email
        return @user
      else
        nil
      end
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

end
