class User < ApplicationRecord
  # Remember to create a migration!
  validates :email, :password, presence: true
  validates :email,  uniqueness: true
end
