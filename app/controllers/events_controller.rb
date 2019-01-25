class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]
  def index
  @events = Event.all
  end

  def new
  @event = Event.new
  end

  def show
   @event = Event.find(params[:id])
  end

  def create
   @event = Event.new(event_params)
      if @event.save
        flash[:notice] = 'Wydarzenie dodane!'
        redirect_to @event
      else
        render 'new'
      end
  end
end
private

  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end
  def check_logged_in
        authenticate_or_request_with_http_basic("Ads") do |username, password|
            username == "admin" && password == "admin"
        end
  end
