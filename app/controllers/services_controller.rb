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
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
