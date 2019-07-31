class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @creator = current_user
    @users = User.where("id != ?", current_user.id)
    @event = Event.new
  end

  def create
    @creator = current_user
    invitation_ids = params[:invitation_ids]
    event = @creator.events.build(validate_event_params)
    debugger
    if @creator.save
      flash.notice = 'Event created successfully.'
      invitation_ids.each do |id|
        user = User.find(id)
        UserMailer.join_event_mail(user, event).deliver_now
      end
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
