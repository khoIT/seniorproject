class RidesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  #create a new ride upon request
  def create
    ride = Ride.create(start: params[:ride][:ride_start],
                       destination: params[:ride][:destination],
                       time: DateTime.strptime(params[:ride][:time], '%m/%d/%Y %I:%M %p'),
                       comment: params[:ride][:comment])
    ride.passengers << current_user
    ride.passenger_rides.find_by_passenger_id(current_user.id).update_attributes!(confirmed: "true")
    redirect_to root_path
  end

  def update_seats
    ride = Ride.find_by_id(params[:id])
    ride.update_attributes!(seats_left: params[:ride][:seats])
    redirect_to user_path(current_user)
  end

  def list_start
    @start = Ride.all.order(:start).where("start like ?", "%#{params[:term]}%")
    render json: @start
  end
end
