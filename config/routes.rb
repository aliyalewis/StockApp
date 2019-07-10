Rails.application.routes.draw do
  resources :stocks
  resources :users

  get 'login', to: 'auth#new'
  post 'login', to: 'user#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'



  resources :users do
    resources :comments
  end

  resources :users do
    resources :portfolio
  end

  resources :users do
    resources :watchlist
  end

  resources :stocks do
    resources :comments
  end

  # Routed from POST /items/:id/add_to_cart

end
