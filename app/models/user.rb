class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :venmo]
  has_many :passenger_rides, foreign_key: "passenger_id", dependent: :destroy
  has_many :rides, through: :passenger_rides, class_name: "Ride"

  has_many :fares, foreign_key: "driver_id", class_name: "Ride", inverse_of: :user

  scope :driver, -> {where("driver = ?", true)}
  after_create :send_welcome_email

  def passenger?(ride)
    passenger_ride = self.passenger_rides.find_by_ride_id(ride.id)
    passenger_ride ? passenger_ride.confirmed == true : false
  end

  def driver?(ride)
      ride.driver_id == self.id
  end

  def cost(ride)
    ride.cost.to_f / ride.passengers.count.to_f
  end

  def paid?(ride)
    passenger_ride = self.passenger_rides.find_by_ride_id(ride.id)
    passenger_ride.paid == true
  end

  def paid!(ride)
    passenger_ride = self.passenger_rides.find_by_ride_id(ride)
    passenger_ride.update_attributes!(paid: true)
  end

  def drive!(ride)
    ride.update_attributes(driver_id: self.id)
    self.fares << ride
  end

  def hop_on!(ride)
     self.rides << ride
     self.passenger_rides.find_by_ride_id(ride.id).update_attributes!(confirmed: "false")
  end

  def jump_off!(ride)
     if !ride.seats_left.nil? then
       ride.seats_left += 1
       ride.save!
     else
       ride.destroy
     end
     self.rides.delete(ride)
  end

  def cancel!(ride)
     self.rides.delete(ride)
  end

  def pending?(ride)
     passenger_ride = self.passenger_rides.find_by_ride_id(ride.id)
     passenger_ride ? passenger_ride.confirmed == false : false
  end

  def is_driver?
    User.where(driver:true).exists?(self)
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.new
     end
     user
  end

  private

    def send_welcome_email
      UserMailer.welcome(self).deliver
    end
end
