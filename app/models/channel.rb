class Channel < ApplicationRecord
  # Remember to create a migration!
  validates :name, :callsign, :price_per_month, presence: true

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user, foreign_key: :user_id
end
