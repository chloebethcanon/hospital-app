class Event < ActiveRecord::Base
  has_many :categorized_events
  has_many :categories, through: :categorized_events
end
