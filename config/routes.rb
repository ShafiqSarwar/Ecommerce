Rails.application.routes.draw do
  resources :listings
  get 'home/index'
  devise_for :users, controllers:{ omniauth_callbacks: "users/omniauth_callbacks" }	
  root 'welcome#index'
end
