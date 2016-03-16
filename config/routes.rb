Rails.application.routes.draw do
  resources :campaigns

  resources :users
  
  resources :search
  get '/search', to: 'search#search', via: 'GET'

  root to:'home#index'
end
