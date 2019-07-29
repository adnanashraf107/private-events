class UserController < ApplicationController

  def index
    @events = User.find(current_user.id).events.all
  end

end
