class Subscription < ApplicationRecord
  validates :user_id, presence: true
  validates :channel_id, presence: true

  belongs_to :user
  belongs_to :channel
end
