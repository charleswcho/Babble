class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    message = Message.new(message_params)

    message.user = current_user

    recipient_id = request.referer.split('users/').last.to_i

    if recipient_id != 0
      message.recipient_id = recipient_id
    end

    if message.save
      ActionCable.server.broadcast 'messages',
        message: message,
        user: message.user
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :recipient_id)
  end
end
