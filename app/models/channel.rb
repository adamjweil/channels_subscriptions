class Channel < ApplicationRecord

  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true
  validates :callsign, presence: true
  validates :price_per_month, presence: true
end
