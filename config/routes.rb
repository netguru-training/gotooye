Rails.application.routes.draw do
  resources :recipes
  devise_for :users

  root to: 'visitors#index'

  resources :products, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :servings, only: [:new, :create, :edit, :update, :destroy]
  end
end
