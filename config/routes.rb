Rails.application.routes.draw do
  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Root
  root 'client/home#index'

  # Admin routes
  namespace :admin do
    # Products management
    resources :products do
      member do
        patch :publish
        patch :unpublish
      end
      resources :stocks
    end

    resources :order_details
    resources :orders

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
    resources :categories
    root to: 'root#index'
    get 'dashboard', to: 'dashboard#index'
    
    # Users management
    resources :users, only: [:index, :show] do
      member do
        patch :activate
        patch :deactivate
      end
    end

    
   
    resources :orders do
      member do
        patch :fulfill
        patch :cancel
        patch :ship
      end
    end
 

    
    # Settings
    get 'settings', to: 'settings#index'
    get 'settings/edit', to: 'settings#edit'
    patch 'settings', to: 'settings#update'
  end

  # Client-facing routes
  namespace :client do
    resources :categories, only: [:show]
    resources :products, only: [:show]
    root 'home#index'
    get 'category', to: 'category/index'
    get 'home', to: 'home#index'
    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
end