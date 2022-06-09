# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  get 'dashboard', to: 'dashboard#index'
  resources :workspaces, except: %i[index]

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
  resources :graph_categories
  resources :workspaces do
    resources :graphs, only: %i[destroy], controller: 'workspaces/graphs'
  end

  namespace :system do
    resources :workspaces
    resources :users
  end
end
