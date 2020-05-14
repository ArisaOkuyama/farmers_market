Rails.application.routes.draw do
  
  root 'pages#index'
  
  devise_for :users
  
  resources :users do 
    resources :favorite_farmers, only: [:index, :new,  :create, :show, :destroy ]
  end

  resources :farmers do
    resources :reviews, only: [:index, :new,  :create, :show, :destroy ]
  end

  resources :products
  resources :pages , only: [:create]
  get 'pages/qanda'
  get 'pages/contactus'
  get 'pages/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
