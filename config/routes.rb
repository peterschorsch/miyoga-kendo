Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'

  get :abouts, to: 'abouts#index', path: 'about'
  get :practices, to: 'practices#index', path: 'class-schedule'
  get :contacts, to: 'contacts#index', path: 'contact-us'

  namespace :admin do
    resources :users
  end
end
