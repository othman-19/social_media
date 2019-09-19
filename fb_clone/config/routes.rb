Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:new, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, path: 'auth', path_names: {sign_in: 'login',
                                                sign_out: 'logout',
                                                password: 'secret',
                                                confirmation: 'verification',
                                                unlock: 'unblock',
                                                registration: 'register',
                                                sign_up: 'cmon_let_me_in' }

  devise_scope :user do
      authenticated :user do
         root 'posts#index', as: :authenticated_root
      end
    

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
end