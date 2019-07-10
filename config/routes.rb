Rails.application.routes.draw do
  resources :stocks
  resources :users

  get 'login', to: 'auth#new'
  post 'login', to: 'auth#verify'
  delete '/login', to: 'auth#destroy', as: 'logout'



  resources :users do
    resources :comments
  end

  resources :users do
    resources :portfolios
  end

  resources :users do
    resources :watchlist
  end

  resources :stocks do
    resources :comments
  end

  # Routed from POST /items/:id/add_to_cart

end
