Rails.application.routes.draw do
  
  get 'wikis/index'

  get 'wikis/new'

  resources :users

  resources :charges, only: [:new, :create]
  resources :collaborations, :only => [:new, :destroy]
  
  resources :wikis do
    resources :collaborations
  end

  devise_for :users do
    resources :collaborations, :only => [:new, :destroy]
  end
  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
 
end
