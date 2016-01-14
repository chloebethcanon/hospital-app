class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
  end

  def create
    recipient = User.find_by(email: params[:email])
    @message = Message.create(
      subject: params[:subject],
      body: params[:body],
      user_id: current_user.id
      )
    MessageRecipient.create(
      message_id: @message.id,
      user_id: recipient.id
      )
    redirect_to "/pages"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.delete
    MessageRecipient.where(message_id: params[:id])
    redirect_to "/pages"
  end
  
end
