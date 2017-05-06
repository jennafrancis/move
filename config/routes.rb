Rails.application.routes.draw do
  resources :categories
  resources :reviews
  resources :cities
  resources :group_classes # nest routes within studio
  resources :studios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
