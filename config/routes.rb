Rails.application.routes.draw do
  resources :stocks
  resources :users

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
