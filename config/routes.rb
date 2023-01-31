Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  resources :users 

  get 'log_in', to: 'users#log_in'
  post 'log_in', to: 'users#log_in'
end
