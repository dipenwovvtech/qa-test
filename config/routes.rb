Rails.application.routes.draw do
  resources :questions, except: [:index] do
    resources :answers, except: [:index, :show]
  end
  resources :topics
  devise_for :users
  root to: "home#index"
  get 'home/index'
  post 'follow_user/:user_id/:id', to: "questions#follow_user", as: "follow_user"
  post 'follow_topic/:topic_id/:id', to: "questions#follow_topic", as: "follow_topic"
end
