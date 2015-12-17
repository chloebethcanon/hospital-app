class Category < ActiveRecord::Base
  has_many :categorized_events
  has_many :events, through: :categorized_events
end
