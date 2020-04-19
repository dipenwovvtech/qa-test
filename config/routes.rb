Rails.application.routes.draw do
  resources :topics
  devise_for :users
  root to: "home#index"
  get 'home/index'
end
