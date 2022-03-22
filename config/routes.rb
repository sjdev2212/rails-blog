Rails.application.routes.draw do
  devise_for :users do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  
  

  root "users\#index"



end