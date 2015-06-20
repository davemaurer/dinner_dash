Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end

  resource :admin, only: [:show]

  resources :items, only: [:index, :show]
  resources :orders, only: [:create, :show]
  resource :cart, only: [:create, :show, :update, :destroy]
  post '/items', to: 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root to: "items#index"

  delete '/logout', to: 'sessions#destroy'
end
