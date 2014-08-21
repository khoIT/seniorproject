class WelcomeController < ApplicationController
  def index
    @user = current_user
    @all_rides = Micropost.all
  end

  def by_start
    @user = current_user
    @all_rides = Micropost.all
    @rides_start = @all_rides.group_by {|r| r.start}
  end
end
