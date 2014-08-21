class UserController < ApplicationController
  def rides
    @user = User.find_by_id(4)
  end
  def index
    @user = current_user
  end
end
