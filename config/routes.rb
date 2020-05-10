Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'main_menus/index', to: 'main_menus#index'
  
  get 'helps/index', to: 'helps#index'
  
  get 'lifts/edit', to: 'lifts#edit'
  get 'menus/delete', to: 'menus#delete'
  get 'lifts/delete', to: 'lifts#delete'
  get 'lifts/position', to: 'lifts#position'
  post 'move_higher', to: 'menus#move_higher'
  post 'move_lower', to: 'menus#move_lower'
  patch 'parts/update', to:'parts#update'
  delete 'menus/destroy', to: 'menus#destroy'
  delete 'lifts/destroy', to: 'lifts#destroy'
  
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  
  resources :menus
  
  resources :lifts, only: [:new, :create, :update]
  
  resources :parts, only: [:new, :create, :edit, :update]
end
