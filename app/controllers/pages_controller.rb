class PagesController < ApplicationController

  def index
    @user_events = current_user.events
  end

end
