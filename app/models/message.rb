class Message < ActiveRecord::Base
belongs_to :sender, class_name: "User", foreign_key: "user_id"
has_many :message_recipients
has_many :recipients, through: :message_recipients

  def readable_date
    created_at.strftime("%b %d, %Y")
  end

  def readable_time
    created_at.strftime("%l:%M %p")
  end

end
  