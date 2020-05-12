Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :reviews
  resources :products
  get 'pages/qanda'
  get 'pages/contactus'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
