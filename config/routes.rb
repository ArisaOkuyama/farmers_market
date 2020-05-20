Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users
  
  resources :users do 
    post 'add', to: 'favorite_farmers#create'
    delete 'remove', to: 'favorite_farmers#destroy'
  end
  
  resources :farmers do
    resources :reviews, only: [:index, :new,  :create, :show, :destroy ]
  end
  resources :categories, only:  [:index, :new,  :create, :destroy ]
  resources :products
  resources :pages , only: [:create]
  resources :orders, only: [:new, :complete]
  resources :search, only: [:index]
  
  get 'orders/complete'
  get 'pages/qanda'
  get 'pages/contactus'
  get 'pages/profile'
  get 'pages/admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
