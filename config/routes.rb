Rails.application.routes.draw do
  root to: 'home#index'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :jobs, only: [:new, :create, :edit, :update]
  end

  resources :jobs_favorites, only: [:create, :update, :destroy]
  resources :companies, only: [:show, :index]
  resources :bucket_jobs, only: [:create, :update, :destroy]
  resources :bucket, only: [:index, :show]


  resources :jobs, only: [:index, :show] do
    get 'unavailable', on: :collection
  end

  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :create, :show]
  resources :charges

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/:name', to: 'industries#show', as: :industry
  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
end
