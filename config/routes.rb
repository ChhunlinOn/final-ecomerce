Rails.application.routes.draw do
  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Root
  root 'client/home#index'

  # Admin routes
  namespace :admin do
    resources :products
    resources :categories
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :show]
  end

  # Client-facing routes
  namespace :client do
    get 'home', to: 'home#index'
    get 'profile', to: 'profile#show'
  end
end