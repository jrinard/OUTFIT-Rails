Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  resources :favorite, :only => [:index]
  resources :search, :only => [:index]

  resources :pictures do
    resources :events
  end
  
end
