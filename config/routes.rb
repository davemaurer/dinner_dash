Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :carts, only: [:create, :show]
end
