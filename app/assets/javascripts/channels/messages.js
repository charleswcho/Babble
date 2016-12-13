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

    var $user = $('<b>' + data.user.name + ' : </b>')

    $user.css('color', data.user.color)
    return "<p>" + img + $user.prop('outerHTML') + data.message + "</p>";
  }
});
