Rails.application.routes.draw do
  resources :campaigns

  resources :users
  
  #get '/search/:query' => 'search#search', :as => 'search'
  #
  resources :search
  get '/search', to: 'search#search', via: 'GET'

  root to:'home#index'
end
