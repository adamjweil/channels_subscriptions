class Subscription < ApplicationRecord
  validates :user_id, presence: true
  validates :channel_id, presence: true
end
