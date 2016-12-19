# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  text         :string           not null
#  recipient_id :string
#  user_id      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  validates :text, presence: true

  belongs_to :user

  after_initialize :censor

  def self.generate
    # TODO: Bug introduced when using private method
    sentence = ('a'..'z').to_a.shuffle[0,8].join

    (rand(5)).times do |i|
      # Increasing censoring to normal Twitch levels
      sentence += ' Kappa' if i == rand(5)

      sentence += ' ' + ('a'..'z').to_a.shuffle[0,8].join
    end

    Censored.instance.censor(sentence)
  end

  private

  def censor
    self.text = Censored.instance.censor(self.text || '')
  end

  def rand_word
    ('a'..'z').to_a.shuffle[0,8].join
  end
end
