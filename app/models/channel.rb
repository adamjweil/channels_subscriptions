class Channel < ApplicationRecord
  # Remember to create a migration!
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :users, through: :subscriptions

  validates :name, :callsign, :price_per_month, presence: true
end
