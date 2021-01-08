class EventsController < ApplicationController

  require 'happybirthday'

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user_id = current_user.id
    event.save
    redirect_to events_path
  end

  def index
    @events = Event.all
    @current_user = current_user
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new
    @user = @event.user
  end


  private
  def event_params
    params.require(:event).permit(:title, :content, :eta, :etd, :preiod, :recruitment, :cost, :destination)
  end
end
