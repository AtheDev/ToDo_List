Rails.application.routes.draw do
  root to: "emails#index"
  resources :emails
  devise_for :users
  get 'home', to: "home#index"
  resources :tasks, except: [:show]
end
