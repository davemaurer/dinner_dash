Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  post "/items", to: "items#index"

  resource :cart
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
