class EventUsersController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    event_user = current_user.event_users.new(event_id: @event.id)
    event_user.save
    redirect_to request.referer
  end

  def destroy
    @event = Event.find(params[:event_id])
    event_user = current_user.event_users.find_by(event_id: @event.id)
    event_user.destroy
    redirect_to request.referer
  end
end
