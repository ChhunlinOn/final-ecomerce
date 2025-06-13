Rails.application.routes.draw do
  # Sessions (non-namespaced)
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Root path for the whole app (client-facing root)
  root 'client/home#index'

  # Admin namespace
  namespace :admin do
    root to: 'root#index'
    get 'dashboard', to: 'dashboard#index'

    # Products with nested stocks and member actions
    resources :products do
      member do
        patch :publish
        patch :unpublish
      end
      resources :stocks
    end

    # Order details resource
    resources :order_details

    # Orders with member patch actions
    resources :orders do
      member do
        patch :fulfill
        patch :cancel
        patch :ship
      end
    end

    # Categories resource
    resources :categories

    # Users with limited actions and member patch actions
    resources :users, only: [:index, :show] do
      member do
        patch :activate
        patch :deactivate
      end
    end

    # Settings routes
    get 'settings', to: 'settings#index'
    get 'settings/edit', to: 'settings#edit'
    patch 'settings', to: 'settings#update'
  end

  # Client-facing namespace
  namespace :client do
    resources :categories, only: [:show]
    resources :products, only: [:show]

    root 'home#index'

    get 'category', to: 'category#index'  # fixed typo here
    get 'home', to: 'home#index'

    get 'profile', to: 'profile#show'
    get 'profile/edit', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
end