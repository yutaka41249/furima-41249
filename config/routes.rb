Rails.application.routes.draw do
  get 'products/new'
  get 'products/create'
  devise_for :users
  root to:"items#index"
  resources :products, only: [:new, :create]
  resources :items, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
