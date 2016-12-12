# Use your favorite javascript backend+frontend frameworks/languages to
# create a chat system that does that following:

# 1. Supports 10k concurrent users.

# 2. Write a script to generate those users, with certain attributes assigned
# to each user - color, username, avatar pic.

# 3. Generate a list of 20k random words (censor list) and check each message
# in chat against this censor list. If word is in the list, don't show the
# message.

# 4. Have the 10k users post 5 msgs / minute in the chat room.

# 5. Support private 1 to 1 messaging (optional)

# 6. Deploy at least 10 AWS micro instances and make the system tolerant of
# any individual instance going down. So for example if I am connected to the
# chat system and my instance is removed, my connection should not break and
# my experience should not be interrupted. (optional)

require 'byebug'

1.times do |i|
  user = User.createRandUser

  puts Censored.instance.censoredWords
end
