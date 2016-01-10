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
      @user_service = UserService.find_by(service_id: @service.id, user_id: current_user.id)

    else
      @current_user_opt_in = false
    end
  end

  def edit
    @service = Service.find_by(id: params[:id])
  end

  def update
    @service = Service.find_by(id: params[:id])
    if @service.update(
      title: params[:title],
      category: params[:category],
      description: params[:description]
      )
      flash[:success] = "Service was successfully updated!"
      redirect_to "/services/#{@service.id}"
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find_by(id: params[:id])
    @service.delete
    flash[:success] = "Service was successfully deleted!"
    redirect_to "/services"
  end
  
end
