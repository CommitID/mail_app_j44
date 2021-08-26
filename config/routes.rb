Rails.application.routes.draw do
  resources :emails
  devise_for :users
  root to: 'emails#index'
  resources :tasks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
