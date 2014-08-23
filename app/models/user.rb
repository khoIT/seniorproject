class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :passenger_rides, foreign_key: "passenger_id", dependent: :destroy
  has_many :rides, through: :passenger_rides, class_name: "Ride"

  has_many :fares, foreign_key: "driver_id", class_name: "Ride", inverse_of: :user

  def hopped_in?(ride)
      self.passenger_rides.find_by_ride_id(ride.id)
  end

  def hop_in!(ride)
     self.passenger_rides.create!(ride_id: ride.id)
  end

  def jump_off!(ride)
   self.passenger_rides.find_by_ride_id(ride.id).destroy
  end
end
