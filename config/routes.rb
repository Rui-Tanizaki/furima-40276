Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :users
  resources :furimas do
    resources :orders
  end
end
