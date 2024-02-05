Rails.application.routes.draw do
  devise_for :users

  root to:"furimas#index"
  resources :furimas, only: [:index, :new, :create, :show, :edit,:update]
  resources :users
end
