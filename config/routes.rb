Rails.application.routes.draw do
  # hijacking datastream to listen for WebSocket requests
  mount ActionCable.server => '/cable'

  get 'message/index'

  root 'message#index'
end
