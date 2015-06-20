Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :orders, only: [:create, :show, :index]
  resource :cart, only: [:create, :show, :update, :destroy]
  post '/items', to: 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resource :admin

  root to: "items#index"

  delete '/logout', to: 'sessions#destroy'
end
