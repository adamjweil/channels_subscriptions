class User < ApplicationRecord
  # Remember to create a migration!
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
end
