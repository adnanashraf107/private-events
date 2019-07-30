class UserController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @events = User.find(current_user.id).events
  end

end
