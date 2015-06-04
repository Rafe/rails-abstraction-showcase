Rails.application.routes.draw do
  devise_for :users

  resources :products, only: :index
  resources :order_items, only: [:create, :destroy]
  resources :orders, only: :index do
    member do
      get 'checkout'
      post 'proseed'
    end
  end

  get '/about', to: 'pages#about'

  root 'products#index'
end
