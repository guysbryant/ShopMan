Rails.application.routes.draw do
  resources :products
  resources :purchase_order_lines
  resources :purchase_orders
  resources :roles
  resources :user_roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
