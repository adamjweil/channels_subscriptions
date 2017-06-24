class Channel < ApplicationRecord
  has_many :subscription
  has_many :user
  has_many :subscribers, through: :subscription, foreign_key: :user_id, source: :user
  # Remember to create a migration!
end
