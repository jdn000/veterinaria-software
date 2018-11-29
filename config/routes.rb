Rails.application.routes.draw do
  devise_for :users, module: "users"

  resources :products
  resources :users


  root 'application#inicio'
  get 'products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
