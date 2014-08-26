class RideController < ApplicationController
  def create
    ride = Ride.create(start: params[:start_location],
                       destination: params[:start_location],
                       time: params[:start_location],
                       seats_left: params[:start_location])
    redirect_to user_path(current_user)
  end
end
