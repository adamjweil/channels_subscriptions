class Channel < ApplicationRecord
  # Associations
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  # Validations
  validates :name, presence: true
  validates :callsign, presence: true
  validates :price_per_month, presence: true

end
