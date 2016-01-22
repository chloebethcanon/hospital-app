class EventsController < ApplicationController

  def index
    # if current_user.admin
      events = Event.all
      @events = events.order(:date).order(:start_time)
      search_attribute = params[:search]


      # current_events = {}
      # events.each do |event|
      #   if event.date > DateTime.now
      #     current_events.merge(event)
      #     @events = current_events.order(:date).order(:start_time)
      #   end
      # end
    # else
    #   @events = current_user.events
    # end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      location: params[:location],
      description: params[:description],
      capacity: params[:capacity],
      is_private: params[:is_private],
      image_url: params[:image_url],
      user_id: current_user.id
      )
    redirect_to "/events"
  end

  def show
    @event = Event.find_by(id: params[:id])
    if current_user && Event.find_by(id: params[:id]) == current_user.events.find_by(id: params[:id]) 
      @current_user_registered = true
      @user_event = UserEvent.find_by(event_id: @event.id, user_id: current_user.id)
    else
      @current_user_registered = false
    end  
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      location: params[:location],
      description: params[:description],
      capacity: params[:capacity],
      is_private: params[:is_private],
      image_url: params[:image_url]
      )
      flash[:success] = "Event was successfully updated!"
      redirect_to "/events/#{@event.id}"
    else
      render :edit
    end 
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.delete
    flash[:success] = "Event was successfully deleted!"
    redirect_to "/events"
  end

end
