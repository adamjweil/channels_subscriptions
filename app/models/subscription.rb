class Subscription < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :channel

  # Validations
  validates :user, presence: true
  validates :channel, presence: true
end
