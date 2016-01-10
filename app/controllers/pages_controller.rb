class PagesController < ApplicationController

  def index
    @all_events = Event.all
    @user_events = current_user.events
    @owned_events = current_user.created_events
    @all_services = Service.all
    @managed_services = current_user.managed_services
    @user_services = current_user.services
  end

end
