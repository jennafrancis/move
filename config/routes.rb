Rails.application.routes.draw do
  root 'studios#index'

  resources :cities, only: :index
  post '/cities', to: 'cities#set_city'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: :show do
    resources :reviews, only: :index
  end

  resources :studios, only: [:index, :new, :create, :show] do
    resources :group_classes, only: [:show, :new, :create, :edit, :update]
  end
  resources :group_classes, only: [:create, :edit, :update]

  resources :reviews, only: [:new, :create, :show, :update, :destroy]
  post '/studios/:studio_id/group_classes/:id', to: 'reviews#create_from_ajax'

  resources :categories, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
