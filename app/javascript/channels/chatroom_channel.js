// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connected to the chatroom!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages')
    messages.insertAdjacentHTML('beforeend', data['message'])
  },

  speak(message) {
    return this.perform('speak', { message: message });
  }
  
})

document.addEventListener('DOMContentLoaded', () => {
  const inputMessage = document.getElementById('message-input');
  const button = document.getElementById('send-button');

  button.addEventListener('click', () => {
    const message = inputMessage.value;
    const chatChannel = consumer.subscriptions.subscriptions[0];
    chatChannel.speak({ message: message }); // Ensure this sends the message correctly
    inputMessage.value = '';
  });
});

