# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'notes#index'
  get '/login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, only: %i[new create]

  resources :notes do
    resources :topics, only: [:destroy]
  end

  resources :languages, only: %i[index show] do
    resources :topics, only: %i[index show]
    resources :external_resources, only: %i[new create]
  end
end
