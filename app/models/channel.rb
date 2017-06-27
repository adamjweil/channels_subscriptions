class Channel < ApplicationRecord
  validates :name, presence: true
  validates :callsign, presence: true
  validates :price_per_month, presence: true

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
end
