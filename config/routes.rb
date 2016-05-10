Rails.application.routes.draw do
  resources :user_notenplans
  resources :marks
  resources :subjects
  resources :notenplans
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root :to => 'notenplans#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users
end
