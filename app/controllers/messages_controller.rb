class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message)
      head :ok
    else
      # Handle errors if save fails
      render json: { error: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: { message: message })
  end
end
