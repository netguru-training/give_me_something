Rails.application.routes.draw do
 

  root to: 'visitors#index'
  devise_for :users

  resources :users
  resources :lists
  resources :gifts
  get 'lists/:id' => "shortener/shortened_urls#show"


end
