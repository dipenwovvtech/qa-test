Rails.application.routes.draw do
  resources :questions, except: [:index]
  resources :topics
  devise_for :users
  root to: "home#index"
  get 'home/index'
  post 'follow_user', to: "questions#follow_user"
  post 'follow_topic', to: "questions#follow_topic"
end
