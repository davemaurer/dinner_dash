Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  post '/items', to: 'items#index'

  resource :cart
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resource :admin
  
  root to: "items#index"

  delete '/logout', to: 'sessions#destroy'
end
