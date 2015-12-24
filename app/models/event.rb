class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events
  has_many :categorized_events
  has_many :categories, through: :categorized_events
  belongs_to :user
end
