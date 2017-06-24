class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :user, :channel, presence: true
end
