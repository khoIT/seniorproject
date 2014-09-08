class WelcomeController < ApplicationController
  def index
    if params[:ride] then
      @all_rides = Ride.find_by_id(params[:ride]).matches
    else
      @all_rides = Ride.current
    end
  end

  def by_start
    @user = current_user
    @all_rides = Ride.all
    @rides_start = Ride.active.group_by {|r| r.start}
  end

  def by_start_json
    render json:
    {user: current_user,
    rides_start: Ride.active.group_by {|r| r.start},
    }
  end
end
