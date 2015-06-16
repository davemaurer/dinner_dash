Rails.application.routes.draw do
  resources :items, only: [:index]

  get "/cart", to: "carts#show"
end
