Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  # get 'users/:id', to:'users#checked'
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    collection do
      get 'done'
    end
  end
 end
