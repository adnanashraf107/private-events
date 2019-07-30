Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#index'

  resources :user
  resources :events

  post 'send_invitation' => "invitations#send_invitation"

end
