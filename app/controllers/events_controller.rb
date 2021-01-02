class EventsController < ApplicationController

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
  end
  
  def show
    @event = Event.find(params[:id])
  end


  private
  def event_params
    params.require(:event).permit(:title, :content, :eta, :etd, :preiod, :recruitment, :cost, :destination)
  end
end
