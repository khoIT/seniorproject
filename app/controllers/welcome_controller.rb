class WelcomeController < ApplicationController
  def index
    @all_rides = Ride.current
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
