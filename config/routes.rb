Rails.application.routes.draw do
  devise_for :users, module: "users"
  resources :users


  root 'application#inicio'
  #get 'products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'provider/index'
  root :to => "provider#index"

#ruta articulos
  resources :providers 	 
  root 'providesr#index'
#ruta comentarios
	resources :providers do
	  resources :products
	end
end
