Rails.application.routes.draw do
  resources :users do
  resources :posts
  end 


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"

  # Defines the root path route ("/")

  # root "articles#index"

end