App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var recipient_id = data.message.recipient_id

    if (recipient_id) {
      var $chat = $(".chat-text")

      $chat.removeClass('hidden')
           .append(this.renderMessage(data))
    } else {
      var $messages = $(".messages")

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
