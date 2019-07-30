class UserMailer < ApplicationMailer

  def join_event_mail(user, event)
    @user = user
    @event = event
    mail to: @event.creator.email, from: @user.email, subject: "Joining mail for event: #{@event.title}"
  end

end
