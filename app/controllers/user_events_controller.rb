class UserEventsController < ApplicationController

  def create
    @user_event = UserEvent.create(
      user_id: current_user.id,
      event_id: params[:event_id]
      )
    redirect_to "/pages"
  end

  def destroy
    @user_event = UserEvent.find_by(id: params[:id])
    @user_event.delete
    flash[:success] = "You have successfully unregistered"
    redirect_to "/pages"
  end

end
