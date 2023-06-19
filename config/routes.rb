Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :orders do
    member do
      get 'generate_pdf'
    end
  end
  resources :users
  resources :cart_items
  resources :carts do
    post 'create_order', on: :member
  end

  resources :products do
    resources :sub_products
  end

  get '/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
end
