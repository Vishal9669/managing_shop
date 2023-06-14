Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :orders
  resources :users
  resources :carts
  resources :cart_items

  resources :products do
    resources :sub_products
  end

  get '/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
end
