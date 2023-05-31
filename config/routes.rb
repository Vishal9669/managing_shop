Rails.application.routes.draw do
  root "home#index"
  resources :orders
  resources :users

  resources :products do
    # get 'subproducts', on: :member
    resources :sub_products
  end

  get '/products/:id/selected_subproducts', to: 'products#selected_subproducts', as: 'selected_subproducts'

end
