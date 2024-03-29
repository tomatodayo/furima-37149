Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :products do
    resources :comments, only: :create 
    resources :buys, only: [:index, :create ]
  end

end
