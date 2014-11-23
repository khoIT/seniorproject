class RidesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  #create a new ride upon request
  def create
      ride = Ride.create(start: params[:ride][:ride_start],
                         destination: params[:ride][:destination],
                         start_time: DateTime.strptime(params[:ride][:start_time], '%m/%d/%Y %I:%M %p'),
                         end_time: DateTime.strptime(params[:ride][:end_time], '%m/%d/%Y %I:%M %p'),
                         comment: params[:ride][:comment])
      ride.passengers << current_user
      ride.passenger_rides.find_by_passenger_id(current_user.id).update_attributes!(confirmed: "true")

    if ride.matches.any? then
      UserMailer.match(current_user, ride).deliver
      session[:request] = ride
      redirect_to controller: 'welcome', action: 'index', ride: ride, notice: "We found some rides that may match your request!"
    else
      redirect_to root_path
    end
  end

  def update_seats
    ride = Ride.find_by_id(params[:id])
    ride.update_attributes!(seats_left: params[:ride][:seats])
    redirect_to user_path(current_user)
  end

  def update_cost
    ride = Ride.find_by_id(params[:id])
    ride.update_attributes!(cost: params[:ride][:cost])
    redirect_to user_path(current_user)
  end

  def list_start
    @start = Ride.all.order(:start).where("start like ?", "%#{params[:term]}%")
    render json: @start
  end
end
