class Channel < ApplicationRecord

  has_many :users

  validates :name, presence: true
  validates :callsign, presence: true
  validates :price_per_month, presence: true
end
