class RidesController < ApplicationController

  def new
  end

  def create
    ride = Ride.create(start: params[:ride][:ride_start],
                       destination: params[:ride][:destination],
                       time: params[:ride][:departure_time],
                       seats_left: params[:ride][:seats])
    redirect_to user_path(current_user)
  end
  def list_start
    @start = Ride.all.order(:start).where("start like ?", "%#{params[:term]}%")
    render json: @start
  end
end
