class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def hop_on
    @ride = Ride.find_by_id(params[:ride])
    current_user.hop_in!(@ride)
    redirect_to root_path
  end

  def jump_off
    @ride = Ride.find_by_id(params[:ride])
    current_user.jump_off!(@ride)
    redirect_to root_path
  end

  def accept
    @ride = current_user.fares.find_by_id(params[:ride])
    @ride.accept(User.find_by_id(params[:passenger]))
    redirect_to user_path(current_user)
  end

  def switch_mode
    if current_user.is_driver?
      current_user.update_attributes!(driver: false)
    else
      debugger
      current_user.update_attributes!(driver: true)
    end
    redirect_to root_path
  end

  def drive
    @ride = Ride.find_by_id(params[:ride])
    current_user.drive!(@ride)
    redirect_to root_path
  end
end
