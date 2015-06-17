Rails.application.routes.draw do
  resources :items, only: [:index]
  resource :cart
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
