class User < ApplicationRecord
  # Remember to create a migration!
  has_many :subscriptions
  has_many :channels, through: :subscriptions, source: :channel

  include BCrypt

  def password
     @password ||= Password.new(password_hash)
   end

   def password=(new_password)
     @password = Password.create(new_password)
     self.password_hash = @password
   end

end
