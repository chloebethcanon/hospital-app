class PagesController < ApplicationController

  def index
    @all_events = Event.all
    @user_events = current_user.events
    @owned_events = current_user.created_events
  end

end
