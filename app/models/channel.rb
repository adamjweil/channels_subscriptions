class Channel < ApplicationRecord
  # Remember to create a migration!
  has_many :subscribers, class_name => 'User'
  has_many :subscribers, through: :subscriptions

  validates :name, :callsign, :price_per_month, presence: true
end
