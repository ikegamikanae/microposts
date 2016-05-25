Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get    'signup' , to: 'users#new'
  get    'login'  , to: 'sessions#new'
  post   'login'  , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  get    'setting', to: 'sessions#edit'
  put    'setting', to: 'sessions#update'
  
  resources :users
  resources :sessions , only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
