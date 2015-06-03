Rails.application.routes.draw do
  devise_for :users

  resources :products, only: :index
  resources :order_items, only: [:create, :destroy]
  resources :orders, only: :show

  get '/about', to: 'pages#about'

  root 'products#index'
end
