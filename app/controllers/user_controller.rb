class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.where("id != ?", current_user.id)
  end

  def show
    @events = current_user.attended_events
  end

end
