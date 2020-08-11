Rails.application.routes.draw do
  resources :users do
    resources :notes
  end

  get '/notes', to: 'notes#public_index'
end
