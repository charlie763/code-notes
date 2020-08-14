Rails.application.routes.draw do
  root to: 'notes#index'
  
  resources :notes
  resources :languages, only: [:index, :show] do
    resources :topics, only: [:index, :show]
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
 
end
