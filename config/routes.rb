Rails.application.routes.draw do
  root 'home#landing_page'

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

  ### UPDATE CONTENT PAGES (ABOUT, RESOURCES) ###
  resources :contents, only: [:create, :update, :destroy]
  ### ABOUT PAGE ###
  get :abouts, to: 'abouts#index', path: 'about'
  ### CLASS SCHEDULE PAGE ###
  resources :practices, only: [:index, :create, :update, :destroy]
  ### EVENTS PAGE ###
  resources :events, path: 'events', only: [:index, :create, :update, :destroy]
  ### RESOURCES PAGE ###
  get :resources, to: 'resources#index'

  ### USERS ###
  resources :users, only: [:edit, :update]
  
  ##### ADMIN NAMESPACE #####
  namespace :admin do
    root 'admin#dashboard'

    ### USERS PAGE ###
    resources :users, except: [:show]
    
    ### UPDATE CONTENT PAGES (ABOUT, RESOURCES) ###
    resources :contents, only: [:new, :create, :update, :destroy]
    ### ABOUT PAGE ###
    resources :abouts
    ### RESOURCES PAGE ###
    resources :resources

    ### CLASS SCHEDULE PAGE ###
    resources :practices, except: [:show]
    ### EVENTS PAGE ###
    resources :events, except: [:show]

    ### ADDRESS PAGE ###
    resources :addresses, except: [:show]

    ### SOCIAL MEDIA PAGE ###
    resources :social_media, path: 'social-media', except: [:show]
  end
end
