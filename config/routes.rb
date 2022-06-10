# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  resources :workspaces do
    resources :graphs, only: %i[destroy]
  end
  resources :graph_categories

  namespace :graphs do
    resources :flight_hours, only: %i[index]
    resources :usage_spectrums, only: %i[index]
    resources :healths, only: %i[index]
    resources :weights_balances, only: %i[index]
    resources :suspensions, only: %i[index]
    resources :impacts, only: %i[index]
    resources :raw_streams, only: %i[index]
  end

  namespace :system do
    resources :graphs
    resources :users
    resources :workspaces
  end
end
