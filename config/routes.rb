Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :reviews


  namespace :api,defaults: {format: 'json'} do
      namespace :v1 do
        resources :users
        resources :reviews
      end
    end
end
