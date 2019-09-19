Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, skip: [:sessions]

    
    devise_scope :user do
      authenticated :user do
         root 'posts#index', as: :authenticated_root
      end
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end

    as :user do
      get 'login', to: 'devise/sessions#new', as: :new_user_session
      post 'login', to: 'devise/sessions#create', as: :user_session
      match 'signout', to: 'devise/sessions#destroy',
                       as: :destroy_user_session,
                       via: Devise.mappings[:user].sign_out_via
      get 'signup', to: 'devise/registrations#new'
    end
  end
  