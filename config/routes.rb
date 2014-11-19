Rails.application.routes.draw do
  root to: "trails#index"
  resources :comments
  resources :usertrails
  resources :trails
  resources :users
  resources :gear, only: :index
  resources :best, only: :index
  resources :dashboard, only: :index

  get '/auth/:provider/callback', to: 'sessions#create', as: 'twitter'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
