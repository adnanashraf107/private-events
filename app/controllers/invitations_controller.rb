class InvitationsController < ApplicationController

  def send_invitation
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    
    UserMailer.join_event_mail(user, event).deliver_now
    flash.notice = "Your mail for join event is successfully sent."
    redirect_to user_index_path
  end

end
