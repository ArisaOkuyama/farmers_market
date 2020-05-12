Rails.application.routes.draw do
  root 'pages#index'
  resources :reviews
  resources :products
  devise_for :users
  get 'pages/qanda'
  get 'pages/contactus'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
