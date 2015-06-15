Rails.application.routes.draw do
  resources :requests
  devise_for :users
  root to: 'landing#index'
  resources :users
end
