Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  resources :users do
    resources :notes
  end

  get '/notes', to: 'notes#public_index'
end
