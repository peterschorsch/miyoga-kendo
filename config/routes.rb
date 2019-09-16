Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'

  ### LOGIN ###
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  get :abouts, to: 'abouts#index', path: 'about'
  get :practices, to: 'practices#index', path: 'class-schedule'
  get :events, to: 'events#index', path: 'events'
  get :helpful_links, to: 'helpful_links#index', path: 'helpful-links'
  resources :users

  
  namespace :admin do
    resources :users
  end
end
