# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  color                  :string           not null
#  profile_pic            :string           not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, dependent: :destroy

  def self.createRandUser(i)
    User.create! name: Faker::Name.first_name,
                 color: Faker::Color.color_name,
                 profile_pic: Faker::Avatar.image,
                 email: 'fake@gmail.com' + i.to_s,
                 password: '123456',
                 password_confirmation: '123456'
  end

  def babble
    text = Message.generate

    # Using obj instead of create! to save db space
    # message = Message.create!(text: text, user_id: self.id)
    message = { text: text }

    ActionCable.server.broadcast 'messages',
      message: message,
      user: self
  end
end
