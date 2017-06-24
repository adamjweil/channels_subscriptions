class Channel < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, :class_name => 'Subscription', :foreign_key => :user_id
end
