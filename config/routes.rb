Rails.application.routes.draw do

  get 'players/sync', to: 'players#sync'
  resources :players, only: [:index, :show, :sync]

  resources :leagues
  resources :teams
  resources :positions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
