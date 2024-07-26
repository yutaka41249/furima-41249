Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show,:edit, :update, :destroy]
  resources :orders, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
