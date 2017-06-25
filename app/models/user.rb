class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
end
