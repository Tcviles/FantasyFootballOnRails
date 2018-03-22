Rails.application.routes.draw do
  resources :mascots
  authenticated :user do
    root 'welcome#home', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/auth/facebook/callback' => 'sessions#create'

  get 'players/sync', to: 'players#sync'
  resources :players, only: [:index, :show, :sync]

  resources :leagues do
    resources :teams
  end
  resources :teams, only: [:create, :update]
  resources :positions

  root "welcome#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
