Rails.application.routes.draw do
  root 'city#index'
  devise_for :users
  resources :categories, only: :show
  resources :reviews
  resources :cities, only: [:index, :show]
  resources :group_classes, only: :show# nest routes within studio
  resources :studios, only: :show
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
