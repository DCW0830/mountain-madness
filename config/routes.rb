Rails.application.routes.draw do
  root to: "trails#index"
  resources :comments
  resources :usertrails
  resources :trails
  resources :users

  get '/auth/:provider/callback', to: 'sessions#create', as: 'twitter'

end
