Rails.application.routes.draw do

  get "/users" =>'users#index'

  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
