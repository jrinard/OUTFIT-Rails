Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'
  post '/', to: 'home#show', as: 'show'

  resources :favorite, :only => [:index]
  # resources :search, :only => [:index]
  resources :events, :only => [:index]

  resources :pictures do
    resources :events
  end

end
