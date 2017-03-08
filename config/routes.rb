Rails.application.routes.draw do
  devise_for :users
    resources :pictures
  root :to => 'home#index'

  resources :favorite, :only => [:index]
  resources :search, :only => [:index]
end
