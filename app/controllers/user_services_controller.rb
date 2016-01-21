class UserServicesController < ApplicationController

  def create
    @user_service = UserService.create(
      user_id: current_user.id,
      service_id: params[:service_id]
      )
    redirect_to "/pages"
  end

  def create_multiple
    current_user.user_services.destroy_all
    params[:services].each do |service_id|
      @user_service = UserService.create(
        user_id: current_user.id,
        service_id: service_id
        )
    end

    flash[:success] = "Successfully updated preferences!"
    redirect_to "/"
  end

  def destroy
    @user_service = UserService.find_by(id: params[:id])
    @user_service.delete
    flash[:success] = "You have successfully opted-out of this service."
    redirect_to "/pages"
  end
  
end
