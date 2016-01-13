class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
  end

  def create
    @message = Message.create(
      subject: params[:subject],
      body: params[:body]
      )
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
