Rails.application.routes.draw do
  root :to => 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]
  resources :shoes_posts, only: [:new, :create, :index, :show, :destroy] do
    resource :shoes_favorites, only: [:create, :destroy]
    resources :shoes_comments, only: [:create, :destroy]
  end
end
