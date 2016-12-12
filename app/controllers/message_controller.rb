class MessageController < ApplicationController
  def index
    @messages = Message.all
    MyWorker.perform_async()
  end
end
