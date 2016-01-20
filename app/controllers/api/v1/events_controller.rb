class Api::V1::EventsController < ApplicationController

  def index
    @all_events = Event.all
    @user_events = current_user.events
    # @owned_events = current_user.created_events
    @all_services = Service.all
    @managed_services = current_user.managed_services
    @user_services = current_user.services

    @owned_events = []
    @registered_events = []
    @unregistered_events = []
    @all_events.each do |event|
      if event.is_attending?(current_user.id)
        @registered_events << event
      elsif current_user.id == event.user_id
        @owned_events << event
      else
        @unregistered_events << event
      end
    end
  end

  def new
  end

  def create
    @event = Event.new(
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
    if @event.save
      render :show
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
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
    render json: {message: "success!"}
  end

end
