class UserController < ApplicationController
<<<<<<< HEAD

  def index
=======
  def hop_on
    @user = current_user
    @ride = Ride.find_by_id(params[:ride])
    @user.hop_in!(@ride)
    redirect_to root_path
  end

  def jump_off
>>>>>>> 3ffb51c5c9c2f7784a820733c998333abbc03e89
    @user = current_user
    @ride = Ride.find_by_id(params[:ride])
    @user.jump_off!(@ride)
    redirect_to root_path
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
