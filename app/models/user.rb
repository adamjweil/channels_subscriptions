class User < ApplicationRecord
 has_many :subscriptions
 has_many :channels, {through: :subscriptions, source: :channel}
 validates :email, {presence: true, uniqueness: true}
 validates :password_hash, presence: true
 include BCrypt

 def password
   @password ||= Password.new(password_hash)
 end
 def password=(new_password)
   @password = Password.create(new_password)
   self.password_hash = @password
 end
 def total_subscription_price
   self.channels.map{|c| c.price_per_month}.sum
 end
end
