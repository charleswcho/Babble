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

censoredWords = {}

i = 0

while i < 20
  currWord = ('a'..'z').to_a.shuffle[0,8].join

  if censoredWords[currWord]
    next
  else
    censoredWords[currWord] = true
    i += 1
  end
end

# censoredWords['Hi'] = true

print censoredWords

1.times do |i|
  name = Faker::Name.first_name
  color = Faker::Color.color_name
  profile_pic = Faker::Avatar.image

  user = User.create!(name: name, color: color, profile_pic: profile_pic)
  user.babble
end



# msg = Message.create!(text: 'Hi there', user_id: user.id)
#
# msg.text.split.each do |word|
#     if censoredWords[word]
#       msg.update_attribute(:text, '<message deleted>')
#     end
# end
#
# print msg.text
