class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_events
  has_many :events, through: :user_events
  has_many :created_events, class_name: "Event", foreign_key: "user_id"
  has_many :user_services
  has_many :services, through: :user_services
  has_many :managed_services, class_name: "Service", foreign_key: "user_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "user_id"

  has_many :message_recipients
  has_many :received_messages, through: :message_recipients, source: :message

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_hospital_staff?
    self.roles.exists?(2)
  end
end
