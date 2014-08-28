class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :passenger_rides, foreign_key: "passenger_id", dependent: :destroy
  has_many :rides, through: :passenger_rides, class_name: "Ride"

  has_many :fares, foreign_key: "driver_id", class_name: "Ride", inverse_of: :user

  scope :driver, -> {where(driver: true)}

  def passenger?(ride)
    passenger_ride = self.passenger_rides.find_by_ride_id(ride.id)
    passenger_ride ? passenger_ride.confirmed == true : false
  end

  def driver?(ride)
      ride.driver_id == self.id
  end

  def drive!(ride)
    ride.update_attributes(driver_id: self.id)
    self.fares << ride
  end

  def hop_in!(ride)
     self.rides << ride
     self.passenger_rides.find_by_ride_id(ride.id).update_attributes!(confirmed: "false")
  end

  def jump_off!(ride)
     ride.seats_left += 1
     ride.save!
     self.rides.delete(ride)
  end

  def cancel!(ride)
     self.rides.delete(ride)
  end

  def pending?(ride)
     ride = self.passenger_rides.find_by_ride_id(ride.id)
     ride ? ride.confirmed == false : false
  end

  def is_driver?
    User.where(driver:true).exists?(self)
  end
end
