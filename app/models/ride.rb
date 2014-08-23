class Ride < ActiveRecord::Base
   has_many :passenger_rides, foreign_key: "ride_id", dependent: :destroy
   has_many :passengers, through: :passenger_rides, class_name: "User"
   validates :start, :destination, :time, presence: true

   belongs_to :user, inverse_of: :rides

   def pending_passengers
     ids = []
     passenger_rides = self.passenger_rides.where(confirmed: "false")
     passenger_rides.each do |p|
       ids << p.passenger_id
     end
     User.find(ids)
   end
end

