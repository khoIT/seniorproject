class Micropost < ActiveRecord::Base
   has_many :passenger_rides, foreign_key: "ride_id", dependent: :destroy
   has_many :passengers, through: :passenger_rides, source: :passenger, class_name: "User"
end
