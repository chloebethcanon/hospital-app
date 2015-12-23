class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :user_events
  has_many :events, through: :user_events

  def full_name
    "#{first_name} #{last_name}"
  end
end
