Rails.application.routes.draw do
  root to: 'notes#index'

  resources :users do
    resources :notes
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  get '/notes', to: 'notes#index'
  # get '/notes/search', to: 'notes#home'
  # post '/notes/search'
end
