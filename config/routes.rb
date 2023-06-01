Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :orders
  resources :users

  resources :products do
    resources :sub_products
  end

  get '/products/:id/selected_subproducts', to: 'products#selected_subproducts', as: 'selected_subproducts'

end
