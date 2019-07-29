class UserController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @events = User.find(current_user.id).events
  end

end
