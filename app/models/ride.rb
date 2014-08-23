class Ride < ActiveRecord::Base
   has_many :passenger_rides, foreign_key: "ride_id", dependent: :destroy
   has_many :passengers, through: :passenger_rides, class_name: "User"
   validates :start, :destination, :time, presence: true

   belongs_to :user, inverse_of: :rides
end
