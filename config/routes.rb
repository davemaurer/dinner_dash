Rails.application.routes.draw do
  resources :items, only: [:index]
  post "/items", to: "items#index"

  resource :cart
end
