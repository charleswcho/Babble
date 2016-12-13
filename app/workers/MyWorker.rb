class MyWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { secondly(12) }

  def perform
    User.all.each { |user| user.babble }
  end
end
