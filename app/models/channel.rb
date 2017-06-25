class Channel < ApplicationRecord
  has_many :subscriptions, foreign_key: :channel_id
  has_many :subscribers, class_name: :User, through: :subscriptions
end
