Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'main_menus/index', to: 'main_menus#index'
  
  get 'helps/index', to: 'helps#index'
  
  get 'lifts/position', to: 'lifts#position'
  post'lifts/position_update', to: 'lifts#position_update'
  
  resourses :users, only: [:show, :new, :create, :edit, :update, :destroy]
  
  resourses :menus
  
  resourses :lifts, only: [:new, :create, :edit, :update]
  
  resourses :parts, only: [:new, :create, :edit, :update]
end
