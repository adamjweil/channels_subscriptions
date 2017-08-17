class Subscription < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :channel

  validates :user, :channel, presence: true
end
