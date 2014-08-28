class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  #passenger request to join ride
  def hop_on
    @ride = Ride.find_by_id(params[:ride])
    current_user.hop_in!(@ride)
    redirect_to root_path
  end

  #passenger leave ride
  def jump_off
    @ride = Ride.find_by_id(params[:ride])
    current_user.jump_off!(@ride)
    redirect_to root_path
  end

  #passenger leave ride before ride confirmed
  def cancel
    @ride = Ride.find_by_id(params[:ride])
    current_user.cancel!(@ride)
    redirect_to root_path
  end

  #driver accept passenger's request
  def accept
    @ride = current_user.fares.find_by_id(params[:ride])
    @ride.accept(User.find_by_id(params[:passenger]))
    redirect_to user_path(current_user)
  end

  #driver deny passenger's request
  def deny
    @ride = current_user.fares.find_by_id(params[:ride])
    @ride.deny(User.find_by_id(params[:passenger]))
    redirect_to user_path(current_user)
  end

  #driver accept ride
  def drive
    if current_user.is_driver? then
      @ride = Ride.find_by_id(params[:ride])
      current_user.drive!(@ride)
      redirect_to user_path(current_user)
    else
      redirect_to root_path, notice: "You must be a driver to do this"
    end
  end

  #user switch between driver mode to passenger
  def switch_mode
    if params[:driver] == "true" then
      session[:driver] = "false"
      current_user.update_attributes!(driver: false)
    else
      session[:driver] = "true"
      current_user.update_attributes!(driver: true)
    end
    redirect_to root_path
  end

end
