Rails.application.routes.draw do
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
	
  root 'home#index'
  get 'search', to: 'search#search'
 
  resources :authors
  
  resources :books
  
  resources :categories
  
  resources :posts do
    resources :comments
  end

  resources :users do
    member do
      get :following, :followers
      get :feed
    end
  end
  
  resources :friends, only: [:create, :destroy] 
  resources :favorite_books, only: [:create, :destroy]
  resources :comments

  resources :articles
  get 'tags/:tag', to: 'articles#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }
end