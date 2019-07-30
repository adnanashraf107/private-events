class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @creator = User.find(current_user.id)
    @event = Event.new
  end

  def create
    @creator = User.find(current_user.id)
    @creator.events.build(validate_event_params)
    if @creator.save
      flash.notice = 'Event created successfully.'
      redirect_to user_index_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  private
    def validate_event_params
      params.require(:event).permit(:title, :location, :date)
    end
  
end
