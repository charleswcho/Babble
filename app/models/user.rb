# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(10)
#  color       :string
#  profile_pic :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true

  has_many :messages

  def self.createRandUser
    name = Faker::Name.first_name
    color = Faker::Color.color_name
    profile_pic = Faker::Avatar.image

    User.create!(name: name, color: color, profile_pic: profile_pic)
  end

  def babble
    message = Message.generate

    Message.create!(text: message, user_id: self.id)

    ActionCable.server.broadcast 'messages',
      message: message,
      user: self
  end
end
