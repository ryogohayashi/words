Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :words, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        get 'search'
      end
    end
  end
end
