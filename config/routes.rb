Rails.application.routes.draw do
  

  resources :restaurants
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :reviews


  namespace :api,defaults: {format: 'json'} do
      namespace :v1 do

        devise_for :users

        devise_scope :user do 
          post 'users/log_in',    to: 'sessions#create'
          
        end
        resources :users
        resources :restaurants
        resources :reviews
      end
    end
end
