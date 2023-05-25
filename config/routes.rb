Rails.application.routes.draw do
  root "home#index"
  resources :orders
  resources :users
  resources :products do
    resources :sub_products
  end
end
