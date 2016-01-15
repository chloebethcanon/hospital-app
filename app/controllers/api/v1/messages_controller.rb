class Api::V1::MessagesController < ApplicationController

  def index
    @messages = Message.all
    @sent_messages = current_user.sent_messages
    @received_messages = current_user.received_messages

    messages = @sent_messages.to_a + @received_messages.to_a
    messages = messages.sort! { |a,b| a.created_at <=> b.created_at }
    @messages = messages.reverse
  end

  def new
  end

  def create
    recipient = User.find_by(email: params[:email])
    @message = Message.new(
      subject: params[:subject],
      body: params[:body],
      user_id: current_user.id
      )
    @message_recipient = MessageRecipient.new(
      message_id: @message.id,
      user_id: recipient.id
      )
    if @message.save && @message_recipient.save
      render :show
    else
      render json: { message_errors: @message.errors.full_messages, 
                    recipient_errors: @message_recipient.errors.full_messages 
                    }, status: 422
    end
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.delete
    MessageRecipient.where(message_id: params[:id]).destroy_all
    render json: {message: "success!"}
  end
  
end
