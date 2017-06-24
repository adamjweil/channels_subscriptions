class Subscription < ApplicationRecord
  # Remember to create a migration!
  validates :user_id, :channel_id, presence: true

  belongs_to :user
  belongs_to :channel
end
