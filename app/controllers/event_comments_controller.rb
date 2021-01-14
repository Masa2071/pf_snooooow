class EventCommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    content = EventComment.new(event_comment_params)
    content.user_id = current_user.id
    content.event_id = @event.id
    content.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_comment = @event.event_comments.find(params[:id])
    @event_comment.destroy
    # EventComment.find_by(id: params[:id], event_id: params[:event_id]).destroy
  end

  private

  def event_comment_params
    params.require(:event_comment).permit(:content)
  end

end
