class WelcomeController < ApplicationController
  def index
    @user = current_user
    @all_rides = Ride.all
  end

  def by_start
    @user = current_user
    @rides_start = Ride.all.group_by {|r| r.start}
  end

  def by_start_json
    render json:
    {user: current_user,
    rides_start: Ride.all.group_by {|r| r.start},
    }
  end

end
