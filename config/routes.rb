Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    
    resources :orders, only: [:index, :new, :create]

    collection do
      get 'done'
    end
  end
 end
