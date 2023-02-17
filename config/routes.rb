Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/destroy'

  root 'users#login'
  get 'login', to: 'users#login'

  get 'users_list', to: 'users#users_list'

  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :students do
    get 'index', to: 'students#index'
  end

  resources :users do
    patch 'change_active', to: 'users#change_active'
  end
end
