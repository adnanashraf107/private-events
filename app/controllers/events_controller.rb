class EventsController < ApplicationController

  def new
    @creator = User.find(current_user.id)
    @event = Event.new
  end

  def create
    @creator = User.find(current_user.id)
    @event = Event.new(validate_event_params)
    @event.creator = @creator
    if @event.save
      flash.notice = 'Event created successfully.'
      redirect_to user_index_path
    else
      render :new
    end
  end

  private
    def validate_event_params
      params.require(:event).permit(:title, :location, :date)
    end
  
end
