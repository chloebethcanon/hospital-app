class UserEvent < ActiveRecord::Base
  belongs_to :user#, class_name: "User", foreign_key: "user_id"
  belongs_to :event
end
