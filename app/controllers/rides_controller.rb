class RidesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    ride = Ride.create(start: params[:ride][:ride_start],
                       destination: params[:ride][:destination],
                       time: DateTime.strptime(params[:ride][:time], '%m/%d/%Y %I:%M %p'),
                       comment: params[:ride][:comment])
    redirect_to root_path
  end
  def list_start
    @start = Ride.all.order(:start).where("start like ?", "%#{params[:term]}%")
    render json: @start
  end
end
