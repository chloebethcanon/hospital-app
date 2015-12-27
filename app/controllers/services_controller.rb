class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def new
  end

  def create
    @service = Service.create(
      title: params[:title],
      category: params[:category],
      description: params[:description]
      )
    redirect_to "/services"
  end

  def show
    @service = Service.find_by(id: params[:id])
    if current_user && Service.find_by(id: params[:id]) == current_user.services.find_by(id: params[:id])
      @current_user_opt_in = true
      @user_servie = UserService.find_by(service_id: @service.id, user_id: current_user.id)
    else
      @current_user_opt_in = false
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
