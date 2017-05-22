Rails.application.routes.draw do
  root 'studios#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :cities, only: [:index, :show]
  post '/cities', to: 'cities#set_city'
  resources :group_classes, only: :show
  resources :reviews, only: [:new, :create, :show, :update, :destroy]
  resources :studios, only: [:show, :index] do
    resources :group_classes, only: :show
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
