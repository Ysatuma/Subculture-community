Rails.application.routes.draw do
 
  devise_for :users
  root to: "home#index"

  resources :home, only: [:index] 

  resources :users, only: [:edit, :update] do
    resources :mylist, only: [:index]
    namespace :mylist do
      resources :genre, only: [:show]
    end
  end

  resources :genres, only: [:show]  do

    resources :contents, only:  [:create, :show, :destroy] 

    resources :groups,  only: [:index, :new, :create, :show, :edit, :update] do
      resources :messages, only: [:create]
    end

    namespace :upload do
      resources :contents, only: [:new, :create]

    end
 
  end 
end
