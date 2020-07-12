Rails.application.routes.draw do
  devise_for :users

  resources :notebooks, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'notebooks#index'


end
