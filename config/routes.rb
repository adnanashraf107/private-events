Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  resources :user
  resources :events

end
