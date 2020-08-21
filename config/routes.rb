Rails.application.routes.draw do
  root to: 'notes#index'
  get '/login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  
  resources :notes do
    resources :topics, only: [:destroy]
  end

  resources :languages, only: [:index, :show] do
    resources :topics, only: [:index, :show]
    resources :external_resources, only: [:new, :create]
  end



end
