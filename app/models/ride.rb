class Ride < ActiveRecord::Base
   has_many :passenger_rides, foreign_key: "ride_id", dependent: :destroy
   has_many :passengers, through: :passenger_rides, class_name: "User"
   validates :start, :destination, :time, presence: true

   belongs_to :user, inverse_of: :rides

   scope :current, -> {where("time >= ?", Time.now)}
   scope :active, -> {where("seats_left > ?", 0)}

   #return pending_passengers of this ride
   def pending_passengers
     ids = []
     pending_rides = self.passenger_rides.where(confirmed: "false")
     pending_rides.each do |p|
       ids << p.passenger_id
     end
     User.find(ids)
   end

   def accept(user)
     self.passenger_rides.find_by_passenger_id(user.id).update_attributes!(confirmed: "true")
     self.seats_left -= 1
     self.save!
   end

   def deny(user)
     user.jump_off!(self)
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

   def not_has_driver?
     self.driver_id.nil?
   end

   def pending?(user)
     pending_passengers.include?(user)
   end

   #if ride has same start and destination and less than 12 hours then matches ? returns
   def matches
     Ride.where("lower(start) like ? AND lower(destination) like ? AND id != ?", self.start.downcase, self.destination.downcase, self.id).
       where({time: (self.time - 12.hour)..(self.time + 12.hour)})
   end


end

