class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :passenger_rides, foreign_key: "passenger_id", dependent: :destroy
  has_many :rides, through: :passenger_rides, class_name: "Ride"

  has_many :fares, foreign_key: "driver_id", class_name: "Ride", inverse_of: :user

  def passenger?(ride)
      !self.rides.find_by_id(ride.id).nil?
  end

  def driver?(ride)
      ride.driver_id == self.id
  end

  def hop_in!(ride)
     ride.seats_left -= 1
     ride.save!
     self.rides << ride
  end

  def jump_off!(ride)
     ride.seats_left += 1
     ride.save!
     self.rides.delete(ride)
  end
end
