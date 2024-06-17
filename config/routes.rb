Rails.application.routes.draw do
  devise_for :users
  resources :product_stocks
  root "products#index"
  resources :products
  resources :stocks
  resources :users
  resources :stocks do
    resources :products do
      get 'edit', to: 'product_stocks#edit'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
end
