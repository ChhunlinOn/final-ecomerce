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
    
    # Users management
    resources :users, only: [:index, :show] do
      member do
        patch :activate
        patch :deactivate
      end
    end
    
    # Products management
    resources :products do
      member do
        patch :publish
        patch :unpublish
      end
    end
    
    # Orders management
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
    root 'home#index'
    get 'home', to: 'home#index'
    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
end