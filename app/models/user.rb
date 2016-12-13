class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def self.createRandUser
    name = Faker::Name.first_name
    color = Faker::Color.color_name
    profile_pic = Faker::Avatar.image

    User.create!(name: name, color: color, profile_pic: profile_pic)
  end

  def name
    email.split('@').first
  end

  def babble
    message = Message.generate

    Message.create!(text: message, user_id: self.id)

    ActionCable.server.broadcast 'messages',
      message: message,
      user: self
  end
end
