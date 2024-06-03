Rails.application.routes.draw do
  #resources :product_stocks
  root "products#index"
  resources :products
  resources :stocks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
