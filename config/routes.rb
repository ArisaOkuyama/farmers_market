Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
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
