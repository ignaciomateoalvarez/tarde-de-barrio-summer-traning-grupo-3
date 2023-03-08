Rails.application.routes.draw do
  root 'home#index'

  get 'user_sessions/new'
  get 'user_sessions/destroy'

  get 'login', to: 'user_sessions#new'

  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'register' => 'user_registrations#new', :as => :new
  post 'register' => 'user_registrations#create'

  resources :students do
    resources :comments, only: [:create] do
      post 'likes/toggle_comment_like'
      resources :subcomments, only: [:create]
    end
  end

  resources :users do
    patch 'change_active', to: 'users#change_active'
  end
end
