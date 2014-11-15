Rails.application.routes.draw do
 

  root to: 'visitors#index'
  devise_for :users

  resources :users

  get 'lists/:slug', to: 'lists#show'

  resources :lists 
  resources :gifts


end
