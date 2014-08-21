class UserController < ApplicationController
  def rides
    @user = User.find_by_id(4)
  end
  def index
    @user = User.find_by_id(4)
    render layout: "User"
  end
  def show
  end
end
