Rails.application.routes.draw do
  root to: 'users#sing_in'
  devise_for :users
  resources :users
end
