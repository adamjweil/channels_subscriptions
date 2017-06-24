class User < ApplicationRecord
  has_many :channels, through: :subscriptions
  has_many :subscriptions

  validates :first_name, :last_name, :email, :hashed_password, presence: true
  validates :email, uniqueness: true
end
