Rails.application.routes.draw do
  devise_for :users

  root to: 'notebooks#index'

  resources :notebooks, only: [:index, :new, :show, :create, :edit, :update, :destroy] do 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    collection do
      get "list"
    end
  end

  resources :tags

  resources :super_tags

end
