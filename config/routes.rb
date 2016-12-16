Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  get 'users/:id' => 'users#show'
  resources :messages, only: [:index, :create, :new]

  root 'static_pages#index'

  # hijacking datastream to listen for WebSocket requests
  mount ActionCable.server => '/cable'
end
