Rails.application.routes.draw do
  get 'recommendations/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :incidents, only: [:new, :create, :show, :edit, :update] do
    resources :recommendations, only: [:index]
    member do
      get 'event'
      get 'localisation'
      patch 'update_init'
      patch 'update_init_geo'
      get 'assign_user'
    end
  end
  get '/stats', to: 'pages#stats'
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
