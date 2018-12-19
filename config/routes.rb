Rails.application.routes.draw do
  devise_for :users, module: "users",as: 'devise' #rutaspara el modulo de user devise
  resources :users #rutas personalizadas para crear usuarios

get '/products/info/:id',to:'products#prod_info',as: 'product'
get '/products/info/:id/edit',to:'products#edit',as:'product_edit'
get '/providers/index',to:'providers#index_prov',as:'providers_index'
get '/users_rol', to: 'application#user_rol'
get '/provider_select/',to:  'providers#provider_select',as:'provider_select'

  root 'application#inicio'
  #get 'products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#ruta articulos
  resources :providers   
  root 'providers#index'
#ruta productos
  resources :providers do
    resources :products
  end
resources :users do
  resources :pets, only:[:new,:edit,:show,:index]
end


#ruta mascota
 get 'pet/index'
root :to => "pet#index"

 

end
