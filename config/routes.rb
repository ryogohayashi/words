Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :words, only: [:index, :new, :create, :edit, :destroy] do
      member do
        get 'search'
      end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
