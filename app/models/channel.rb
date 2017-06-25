class Channel < ApplicationRecord
  # Remember to create a migration!
  belongs_to :subscription
end
