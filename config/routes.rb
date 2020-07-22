Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'

  ### LOGIN ###
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  ### PAGES FOR FORGOTTEN PASSWORD ###
  get 'forgotton-password', to: 'sessions#forgot_password'
  get 'sent-email', to: 'sessions#sent_email'
  get 'reset-password', to: 'sessions#reset_password'

  ### POST FOR FORGOTTEN PASSWORD ###
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'

  get :abouts, to: 'abouts#index', path: 'about'
  #get :practices, to: 'practices#index', path: 'class-schedule'
  resources :practices, only: [:index, :update, :destroy]
  resources :events, path: 'events', only: [:index, :update, :destroy]

  get :helpful_links, to: 'helpful_links#index', path: 'resources'
  resources :users, only: [:show, :edit, :update]
  
  namespace :admin do
    root to: 'admin#dashboard'
    resources :users, :pages, :contents, :links, :events
    resources :class_schedules, path: 'class-schedules'
    resources :addresses, :contacts
    resources :social_media, path: 'social-media'
  end
end
