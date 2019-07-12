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
    resources :portfoliosstocks
  end

  resources :stocks do
    resources :comments
  end

end
