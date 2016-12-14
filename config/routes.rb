Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  # hijacking datastream to listen for WebSocket requests
  mount ActionCable.server => '/cable'

  get 'message/index'

  root 'message#index'
end
