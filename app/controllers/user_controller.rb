class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @events = User.find(current_user.id).events
  end

end
