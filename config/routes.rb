Rails.application.routes.draw do


  root to: 'visitors#index'
  devise_for :users

  resources :users

  get 'lists/new', to: 'lists#new'
  get 'lists/:slug', to: 'lists#show'
  get 'lists/:slug/edit', to: 'lists#edit'
  patch 'lists/:slug', to: 'lists#update'
  delete 'lists/:slug', to: 'lists#destroy'

  resources :lists


  resources :gifts do
    member do
      post 'toggle_buyer'
    end
  end



end
