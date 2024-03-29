Rails.application.routes.draw do
  root 'home#landing_page'

  ### LOGIN ###
  resources :sessions, only: [:new, :create, :destroy]
  get "active",  to: "sessions#active"
  get "timeout", to: "sessions#timeout"
  #get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'

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
  resources :practices, except: [:show, :new, :edit]
  ### NEWS PAGE ###
  resources :announcements, path: 'news', except: [:show, :new, :edit]
  ### EVENTS PAGE ###
  resources :events, path: 'events', except: [:show, :new, :edit]
  ### RESOURCES PAGE ###
  get :resources, to: 'resources#index'

  ### USERS ###
  resources :users, only: [:edit, :update] do
    collection do
      patch 'update_password'
    end
  end
  
  ##### ADMIN NAMESPACE #####
  namespace :admin do
    root 'admin#dashboard'

    ### USERS PAGE ###
    resources :users, except: [:show, :destroy] do
      collection do
        patch 'update_dojo_address'
        patch 'update_password'
      end
      get 'resend-token', to: 'users#resend_token'
    end

    ### HOME PAGE IMAGES ###
    resources :home_images, except: [:create, :new, :destroy], path: 'home-images'
    ### ABOUT PAGE ###
    resources :abouts, path: 'about', except: [:destroy]
    ### RESOURCES PAGE ###
    resources :resources, except: [:new, :create, :destroy] do
      get :new_resource, on: :collection, path: 'new-resource'
      post :create_new_resource, on: :collection

      get :new_article, on: :collection, path: 'new-article'
      post :create_new_article, on: :collection
    end

    ### CLASS SCHEDULE PAGE ###
    resources :practices, except: [:show]
    ### NEWS PAGE ###
    resources :announcements, path: 'news'
    ### EVENTS PAGE ###
    resources :events, except: [:destroy]
    resources :addresses, except: [:show]

    ### SOCIAL MEDIA PAGE ###
    resources :social_media, path: 'social-media', except: [:show]
  end
end
