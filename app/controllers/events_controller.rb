class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.create(
      title: params[:title],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      location: params[:location],
      category: params[:category],
      description: params[:description],
      capacity: params[:capacity],
      is_private: params[:is_private],
      )
    redirect_to '/events'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
