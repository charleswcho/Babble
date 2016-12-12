class MyWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { secondly(12) }

  def perform
    User.all.each do |user|
      user.babble
      user.messages.each do |message|
        message.censor(Censored.instance.censoredWords)
      end
    end
  end
end
