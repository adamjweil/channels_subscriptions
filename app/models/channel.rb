class Channel < ApplicationRecord
  # Associations
  has_many :subscriptions

  # Validations
  validates :name, presence: true
  validates :callsign, presence: true
  validates :price_per_month, presence: true

end
