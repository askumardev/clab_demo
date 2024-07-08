class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chatroom_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = current_user.messages.build(content: data['message'])
    if message.save
      ActionCable.server.broadcast 'chatroom_channel', message: render_message(message)
    else
      # Handle errors if save fails
      # For example, broadcast an error message to the channel
      ActionCable.server.broadcast 'chatroom_channel', error: message.errors.full_messages
    end
  end

  private

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: { message: message })
  end
end
