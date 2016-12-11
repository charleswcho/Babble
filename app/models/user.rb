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

  def babble
    Message.create!(text: 'Hi there', user_id: self.id)
  end
end
