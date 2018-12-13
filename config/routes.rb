Rails.application.routes.draw do
  devise_for :users, module: "users"
  resources :users
get '/products/info/:id',to:'products#prod_info',as: 'product'
get '/products/info/:id/edit',to:'products#edit',as:'product_edit'
get '/providers/index',to:'providers#index_prov',as:'providers_index'

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
  resources :pets
end


#ruta mascota
 get 'pet/index'
root :to => "pet#index"

 

end
