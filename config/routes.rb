Rails.application.routes.draw do
  get 'purchases/new'
  get 'purchases/create'

  devise_for :users
  root to: "items#index"


  resources :items do
    resources :orders, only: [:new, :create]
    resources :purchases, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end