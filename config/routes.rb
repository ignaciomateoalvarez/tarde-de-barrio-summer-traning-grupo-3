Rails.application.routes.draw do
  root 'user_sessions#new'

  get 'user_sessions/new'
  get 'user_sessions/destroy'

  get 'login', to: 'user_sessions#new'

  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'register' => 'user_registrations#new', :as => :new
  post 'register' => 'user_registrations#create'

  resources :students do
    get 'index', to: 'students#index'
    resources :comments, only: [:create] do
      resources :subcomments, only: [:create]
    end
  end

  resources :users do
    patch 'change_active', to: 'users#change_active'
  end
end
