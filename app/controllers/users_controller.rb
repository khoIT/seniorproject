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
end
