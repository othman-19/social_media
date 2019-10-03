# frozen_string_literal: true

#Routes.rb
Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  
  resources :posts do
    resources :likes
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'users/registrations' }

  as :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :users, only: %i[index show destroy]
  get '/users/:id/profile', to: 'users#profile', as: 'profile'

end
