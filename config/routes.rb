Rails.application.routes.draw do
  
  get 'wikis/index'

  get 'wikis/new'

  resources :charges, only: [:new, :create]
  resources :collaborations, :only => [:new, :destroy]
  
  resources :wikis

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
 
end
