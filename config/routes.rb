Rails.application.routes.draw do
  resources :requests
  devise_for :users
  root to: 'landing#index'
  resources :users
  resources :landing
  post '/requests/:id', to: 'requests#update'
end
