Rails.application.routes.draw do
  get 'recommendations/index'
  devise_for :users
  root to: 'pages#home'
  resources :incidents, only: [:new, :create] do
    resources :recommendations, only: [:index]
  end
  get '/stats', to: 'pages#stats'
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
