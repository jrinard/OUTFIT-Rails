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

  resources :admin, :only => [:index]

match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
