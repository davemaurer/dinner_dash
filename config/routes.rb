Rails.application.routes.draw do
  namespace :admin do
    resources :categories, only: [:index, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :items, only: [:index, :new, :create, :edit, :update]
  end

  resource :admin, only: [:show]

  resources :items, only: [:index, :show]
  resources :orders, only: [:create, :show, :index]
  resource :cart, only: [:create, :show, :update, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resource :admin

  root to: "items#index"

  delete '/logout', to: 'sessions#destroy'
end
