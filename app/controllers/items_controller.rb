class ItemsController < ApplicationController

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @event = Event.find_by(id: params[:event_id])
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @item = Item.new(item_params)
    if @item.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def destroy
  end

   private
    def item_params
      params.require(:item).permit(:name, :event_id, :user_id)
    end
end
