Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  namespace :admin do
    resources :users
  end



  resources :requests

#  devise_for :users
  root to: 'landing#index'
  #scope "/admin" do
  #  resources :users
  #end
  
  resources :landing
  post '/requests/:id', to: 'requests#update'
end
