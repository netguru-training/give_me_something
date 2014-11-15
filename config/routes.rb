Rails.application.routes.draw do
  get 'lists/index'

  get 'lists/show'

  get 'lists/edit'

  get 'lists/new'

  root to: 'visitors#index'
  devise_for :users

  resources :users
  resources :lists

end
