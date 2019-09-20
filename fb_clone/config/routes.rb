Rails.application.routes.draw do
  resources :posts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  as :user do
      authenticated :user do
         root 'posts#index', as: :authenticated_root
      end
    

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show]
  get '/users/:id/profile', to: 'users#profile', as: 'profile'
end
