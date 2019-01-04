Rails.application.routes.draw do
  
  devise_for :users, module: "users",:path_prefix =>'devise' #rutaspara el modulo de user devise
  resources :users #rutas personalizadas para crear usuarios
  post '/users/new', to: 'users#create'
  get '/select_time', to: 'hour_reservations#datesearch'
  root 'application#inicio'

  resources :horarios
  resources :providers   
  resources :products
  resources :attentions
  resources :hour_reservations
  #resources :users do
   # resources :horarios
 # end
  resources :users do
   resources :pets
  end
 get 'pet/index'
root :to => "pet#index"

 

end
