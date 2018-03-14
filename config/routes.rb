Rails.application.routes.draw do
  resources :leagues
  resources :teams
  resources :players
  resources :positions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
