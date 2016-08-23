Rails.application.routes.draw do
  root to: 'home#index'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :jobs,      only: [:new, :create, :edit, :update]
  end

  namespace :employer do
    resources :dashboard, only: [:index]
    resources :jobs, only: [:new, :create, :edit, :update]
  end

  resources :companies, only: [:index]
  get "/companies/:slug", to: "companies#show", as: "company"

  resources :saved_jobs, only: [:create,:destroy,:index]

  resources :companies,      only: [:index]
  resources :bucket_jobs,    only: [:create, :update, :destroy]
  resources :bucket,         only: [:index, :show]

  resources :jobs, only: [:index, :show] do
    get 'unavailable', on: :collection
  end

  resources :users,  only: [:new, :create, :edit, :update]
  namespace :user do
    resources :job_applications, only: [:index] 
  end
  resources :job_applications, only: [:show, :edit, :update, :create, :index]

  get '/login',                     to: 'sessions#new'
  post '/login',                    to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'
  get '/dashboard',                 to: 'users#show'
  get '/industries/:industry_slug', to: 'industries#show', as: :industry

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
end
