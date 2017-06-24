class User < ApplicationRecord

  validates :first_name, :last_name, :email, :hashed_password, presence: true
  validates :email, uniqueness: true
end
