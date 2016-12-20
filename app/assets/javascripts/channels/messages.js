App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var $chat = $(".chat-text"),
        $messages = $(".messages")

    if (data.message.recipient_id) {
      $chat.removeClass('hidden')
           .append(this.renderMessage(data))
           .scrollTop($chat[0].scrollHeight)
    } else if ($messages) {
      $messages.removeClass('hidden')
               .append(this.renderMessage(data))
               .scrollTop($messages[0].scrollHeight)
    }
  },

  renderMessage: function(data) {
    var user = data.user,
        img = '<img src=' + user.profile_pic +
              "alt='profile pic' height='18' width='18'>"

    var url = './users/' + user.id
        $name = $('<a href=' + url + '>' + user.name + '</a>'),
        nameStr = $name.css('color', user.color)
                       .css('font-weight', 'bold')
                       .prop('outerHTML') // Convert to string

    return "<p class='message'>" + img + nameStr + ' : ' + data.message.text + "</p>"
  }
});
