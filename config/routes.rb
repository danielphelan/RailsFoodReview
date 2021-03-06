Rails.application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
          get 'users/',    to: 'users#index'
          get 'restreview/:id',    to: 'restaurants#rest_reviews'
          post 'users/register', to: 'users#create'
          
        end
        resources :users
        resources :restaurants
        resources :reviews
      end
    end
end
