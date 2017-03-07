Rails.application.routes.draw do
  devise_for :users
    resources :pictures
  root :to => 'home#index'

  get 'favorites', :to => 'favorite#index'

end
