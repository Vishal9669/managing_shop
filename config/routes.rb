Rails.application.routes.draw do
  root "home#index"

  resources :users
  resources :products
  resources :orders
  resources :sub_products
  # resources :products do
  #   resources :sub_products
  # end



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
