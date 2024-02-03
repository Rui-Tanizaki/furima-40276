Rails.application.routes.draw do
  devise_for :users

  root to:"furimas#index"
  resources :furimas, only: [:new, :create]
  resources :users
end
