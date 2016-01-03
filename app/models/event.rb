class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events
  has_many :categorized_events
  has_many :categories, through: :categorized_events
  belongs_to :user

  def readable_date(date)
    if date
      date.strftime("%A, %b %d, %Y")
    end
  end

  def readable_time(time)
    if time
      time.strftime("%l:%M %p")
    end
  end
end
