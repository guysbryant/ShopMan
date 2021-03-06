Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  root to: 'sessions#homepage'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :sales_order_lines, except: [:show]
  resources :sales_orders do
    resources :sales_order_lines, shallow: true
  end
  resources :customers do
    resources :sales_orders, shallow: true
  end
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
