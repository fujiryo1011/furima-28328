Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  post 'items', to:'items#create'
  # get 'users/:id', to:'users#checked'
end
