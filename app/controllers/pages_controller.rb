class PagesController < ApplicationController

  def index
    @all_events = Event.all
    @user_events = current_user.events
    @owned_events = current_user.created_events
    @all_services = Service.all
    @managed_services = current_user.managed_services
    @user_services = current_user.services
    @sent_messages = current_user.sent_messages
    @received_messages = current_user.received_messages

    messages = @sent_messages.to_a + @received_messages.to_a
    messages = messages.sort! { |a,b| a.created_at <=> b.created_at }
    @messages = messages.reverse
    
  end

end
