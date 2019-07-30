class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @events = current_user.attended_events
  end

end
