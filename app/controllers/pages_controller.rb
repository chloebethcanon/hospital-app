class PagesController < ApplicationController

  def index
    @all_events = Event.all
    @user_events = current_user.events
  end

end
