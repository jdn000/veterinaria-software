Rails.application.routes.draw do
  
  devise_for :users, module: "users",:path_prefix =>'devise' #rutaspara el modulo de user devise
  resources :users #rutas personalizadas para crear usuarios
post '/users/new', to: 'users#create'

get '/users_rol', to: 'application#user_rol'

  root 'application#inicio'

  resources :providers   
  resources :products
  resources :attentions

resources :users do
  resources :pets, only:[:new,:edit,:show,:index]
end

 get 'pet/index'
root :to => "pet#index"

 

end
