Rails.application.routes.draw do
  # resources :sessions
  root to: "sessions#homepage"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :customers
  resources :products
  resources :purchase_order_lines
  resources :purchase_orders
  resources :roles
  resources :user_roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
