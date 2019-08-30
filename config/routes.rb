Rails.application.routes.draw do
  get 'reports/show'
  get 'recommendations/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :incidents, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :recommendations, only: [:index]
    resources :proofs, only: [:new, :create, :index, :destroy]
    resources :reports, only: [:show, :create]
    member do
      get 'event'
      get 'localisation'
      get 'modify_event'
      patch 'update_init'
      patch 'update_init_geo'
      patch 'update_event'
      get 'assign_user'
    end
  end

  get '/stats', to: 'pages#stats'
  get '/about', to: 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
