class OwnRide < ActiveRecord::Base
  belongs_to :user
  has_one :created_ride, class_name: "Micropost"
end
