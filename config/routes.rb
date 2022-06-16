# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  devise_for :users

  get 'workspace', to: 'workspace#index'
  get 'account', to: 'account#show'

  namespace :graphs do
    resources :flight_hours, only: %i[index]
    resources :usage_spectrums, only: %i[index]
    resources :healths, only: %i[index]
    resources :weights_balances, only: %i[index]
    resources :suspensions, only: %i[index]
    resources :impacts, only: %i[index]
    resources :raw_streams, only: %i[index]
  end

  resources :graphs
  resources :bookmarks do
    resources :graphs, only: %i[destroy], controller: 'bookmarks/graphs'
  end

  namespace :system do
    resources :users, only: %i[index show]
    resources :roles, except: %i[show]
  end
end
