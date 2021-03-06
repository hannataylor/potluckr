class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
     @event = Event.find_by(id: params[:id])
     @item = Item.new
  end

  def index
    @events_upcoming = Event.all.upcoming
    @events_past = Event.all.past
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end

end
