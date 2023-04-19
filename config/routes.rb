Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
 end

  resources :users, only: [:edit, :update]

  #resources :purchase_records, only: [:index, :create]

  
end