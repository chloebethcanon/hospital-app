class UserServicesController < ApplicationController

  def create
    @user_service = UserService.create(
      user_id: current_user.id,
      service_id: params[:service_id]
      )
    redirect_to "/pages"
  end

  def destroy
    @user_service = UserService.find_by(id: params[:id])
    @user_event.delete
    flash[:success] = "You have successfully opted-out of this service."
    redirect_to "/pages"
  end
  
end
