class Service < ActiveRecord::Base
  has_many :user_services
  has_many :users, through: :user_services
  belongs_to :user
end
