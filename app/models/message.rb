# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  user_id    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  validates :text, presence: true

  belongs_to :user

  def censor(hash)
    self.text.split.each do |word|
      self.update_attribute(:text, '<message deleted>') if hash[word]
    end
  end
end
