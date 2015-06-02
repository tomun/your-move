Rails.application.routes.draw do

  root 'statics#home'

  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  get 'dashboard' => 'dashboards#index', as: :dashboard
  get 'home' => 'dashboards#home', as: :home

  post 'respond/:answer/:link_hash' => 'invitations#respond', as: :respond
  post 'withdraw/:link_hash' => 'invitations#withdraw', as: :withdraw

  resources :players, only: [:new, :create]
  resources :invitations
  resources :games do
    member do
      get 'move' => 'games#move'
    end
    get 'browser' => 'games#sse_index'
  end

end
