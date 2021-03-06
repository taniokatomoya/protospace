Rails.application.routes.draw do
  devise_for :users
  resources  :users, only: %i[edit update show]

  namespace :prototypes do
    resources :popular, only: :index
    resources :tags, param: :tag_name, only: %i[index show]
  end
  resources :prototypes do
    resources :comments, only: :create
  end

  post   '/:prototype_id/like'   => 'likes#like',   as: :like
  delete '/:prototype_id/unlike' => 'likes#unlike', as: :unlike

  root 'prototypes#index'
end
