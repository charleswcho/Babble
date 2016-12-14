class MessageController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end
end
