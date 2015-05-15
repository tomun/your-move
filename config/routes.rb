Rails.application.routes.draw do

  root 'statics#home'

  post '/' => 'sessions#new'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  resources :players, only: [:new, :create]
  resources :invitations

end
