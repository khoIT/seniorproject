class Ride < ActiveRecord::Base
   has_many :passenger_rides, foreign_key: "ride_id", dependent: :destroy
   has_many :passengers, through: :passenger_rides, class_name: "User"
   validates :start, :destination, :time, presence: true

   belongs_to :user, inverse_of: :rides

   scope :current, -> {where("time >= ?", Time.now)}
   scope :active, -> {where("seats_left >= ?", 0)}

   #return pending_passengers of this ride
   def pending_passengers
     ids = []
     passenger_rides = self.passenger_rides.where(confirmed: "false")
     passenger_rides.each do |p|
       ids << p.passenger_id
     end
     User.find(ids)
   end

   def accept(user)
     debugger
     self.passenger_rides.find_by_passenger_id(user.id).update_attributes!(confirmed: "true")
     self.seats_left -= 1
     self.save!
   end

   def new
     @ride = Ride.new
   end

   def self.list_start
     Ride.all.map(&:start).uniq.sort
   end

   def self.list_destination
     Ride.all.map(&:destination).uniq.sort
   end

end

