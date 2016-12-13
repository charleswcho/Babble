App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var $messages = $(".messages")

    $messages.removeClass('hidden')
    return $messages.append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    var img = '<img src=' +
              data.user.profile_pic +
              "alt='profile pic' height='18' width='18'>"

    var $name = $('<b>' + data.user.name + '</b>'),
        nameStr;

    $name.css('color', data.user.color)

    nameStr = $name.prop('outerHTML')

    return "<p class='message'>" + img + nameStr + ' : ' + data.message + "</p>";
  }
});
