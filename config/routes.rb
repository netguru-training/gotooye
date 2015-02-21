Rails.application.routes.draw do
  resources :recipes
  devise_for :users

  root to: 'visitors#index'

  resources :products, only: [:index, :new, :create]
end
