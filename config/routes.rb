Rails.application.routes.draw do
  get 'steps/add', as: 'add_step'

  resources :recipes do
    resources :steps, only: [:new, :create]
  end

  devise_for :users

  get '/users/', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  
  root to: 'visitors#index'

  resources :products, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :servings, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/ingredient-template/:product_id', to: 'template#display_product_servings'
  resources :favourite_products, only: [:create]
  delete '/favourite_products/', to: 'favourite_products#destroy'
end
