Rails.application.routes.draw do
  get 'reports/show'
  get 'recommendations/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :incidents, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :recommendations, only: [:index]
    resources :proofs, only: [:new, :create, :index, :destroy]
    resources :nonprofits, only: [:index]
    resources :reports, only: [:show, :create] do
      member do
        get 'create_complaint'
        get 'report_complaint'
        patch 'update_report'
        patch 'update_complaint_report'
        get 'send_anonymous_report'
      end
    end
    resources :testimonies, only: [:new, :create, :index, :destroy, :edit, :update]
    member do
      get 'event'
      get 'localisation'
      get 'modify_event'
      patch 'update_init'
      patch 'update_init_geo'
      patch 'update_event'
      get 'assign_user'
      patch 'update_zipcode'
    end
  end

  get '/stats', to: 'pages#stats'
  get '/about', to: 'pages#about'

  #%w(git 404 500).each do |code|
    #get code, :to => "errors#show", :code => code
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
