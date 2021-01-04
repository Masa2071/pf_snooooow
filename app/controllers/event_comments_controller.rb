class EventCommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    content = EventComment.new(event_comment_params)
    content.user_id = current_user.id
    content.event_id = event.id
    content.save
    redirect_to request.referer

  end

  def destroy
    EventComment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    redirect_to request.referer
  end

  private

  def event_comment_params
    params.require(:event_comment).permit(:content)
  end

end
