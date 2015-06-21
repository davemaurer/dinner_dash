Rails.application.routes.draw do
  root to: "admins#show"
  resource :admin, only: [:show]

  namespace :admin do
    resources :categories, only: [:index, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :items, except: [:destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index, :show]
  post '/items', to: 'items#index'

  resources :orders, only: [:create, :show, :index]
  resource :cart, only: [:create, :show, :update, :destroy]
end
