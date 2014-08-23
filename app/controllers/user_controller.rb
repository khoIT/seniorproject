class UserController < ApplicationController

  def index
    @user = current_user
  end
  def hop_on
    @user = current_user
    @ride = Ride.find_by_id(params[:ride])
    @user.hop_in!(@ride)
    redirect_to root_path
  end

  def jump_off
    @user = current_user
    @ride = Ride.find_by_id(params[:ride])
    @user.jump_off!(@ride)
    redirect_to root_path
  end
end
