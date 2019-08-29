Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'

  get :practices, to: 'practices#index', path: 'class-schedule'

  namespace :admin do
    resources :users
  end
end
