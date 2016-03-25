Rails.application.routes.draw do
  resources :campaigns

  resources :users
  
  resources :search
  get '/search', to: 'search#search', via: 'GET'

  get '/search_auto', to:'search#search_auto', via: 'GET'
  root to:'home#index'
end
