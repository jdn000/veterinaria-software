Rails.application.routes.draw do

  devise_for :users, module: "users",:path_prefix =>'devise' #rutaspara el modulo de user devise

  resources :users #rutas personalizadas para crear usuarios
  post '/users/new', to: 'users#create'

  get '/select_time', to: 'hour_reservations#datesearch'

  root 'application#inicio'
  get '/clientes', to: 'users#indexc', as: 'clientes'


  get '/attentions/existente', to: 'attentions#existente', as: 'existente_attentions'
  post '/attentions/existente', to: 'attentions#create'
  #get '/attentions/nuevo/ficha', to: 'attentions#nuevo', as: 'nuevo_attentions'
  #post 'attentions/nuevo/ficha',to:  'attentions#fabricar'
  get '/attentions/buscar', to: 'attentions#buscar', as: 'tabla_attentions'
  get '/attentions/mostrar/:id', to: 'attentions#mostrar', as: 'mostrar_attentions'
  get '/attentions/mis_fichas', to: 'attentions#mis_fichas', as: 'mis_attentions'
  get '/attentions/search', to: 'attentions#search', as: 'search'

  get '/attentions/new/:id' , to: 'attentions#new' , as: 'nueva_ficha'
  
  resources :horarios
  resources :providers 
  resources :products 
  resources :hour_reservations
  resources :attentions
  #resources :users do
   # resources :horarios
 # end
  resources :users do
   resources :pets
  end
 get 'pet/index'
root :to => "pet#index"

 

end
