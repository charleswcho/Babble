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

  def self.generate
    sentence = rand_word

    (rand(5)).times do |i|
      # Increasing censoring to normal Twitch levels
      sentence += ' Hi' if i == rand(5)

      sentence += ' ' + rand_word
    end

    Censored.instance.censor(sentence)
  end

  private

  def rand_word
    ('a'..'z').to_a.shuffle[0,8].join
  end
end
