Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :orders, only: [:create, :show]
  resource :cart, only: [:create, :show, :update, :destroy]
  post '/items', to: 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: "items#index"
end
