Rails.application.routes.draw do
  devise_for :users

  root to: "furimas#index"
  resources :furimas do
    resources :orders, param: :item_id  # :item_id を使用するように変更
  end
  resources :users
end
