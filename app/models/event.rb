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

  def calendar_date(date)
    if date
      date.strftime("%Y-%m-%d")
    end
  end

  def user_registered?(user)
    users.include?(user)
  end

  def get_user_event_id(user)
    user_event = UserEvent.find_by(event_id: id, user_id: user.id)
    if user_event
      user_event.id
    else
      nil
    end
  end

  def is_attending?(user)
    self.users.exists?(id: user)
  end

  def attendance
    attendance = (self.users.length.to_f / self.capacity.to_f) * 100
    @attendance = attendance.to_i
    return "width: #{@attendance}%;"
  end

  def spots_left
    self.capacity - self.users.length
  end
end
