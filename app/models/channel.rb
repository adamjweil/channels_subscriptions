class Channel < ApplicationRecord
  # Remember to create a migration!
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :subscriptions
end
