class ProvidersController < ApplicationController
before_action :require_certain_role
	# autentificacion 
#http_basic_authenticate_with name: "cloud", password: "123", except: [:index, :show]
	def index #index 'falso' solo para los productos
	  @providers = Provider.all
	end
    def index_prov
    	@providers= Provider.all
    end
	def show
		@provider = Provider.find(params[:id])
		@products=Product.where(" provider_id = ? ", @provider.id)
	end

	def provider_select
		@providers=Provider.all
	end

	def new
		@provider = Provider.new
	end

	def create
	  	@provider = Provider.new(provider_params)
	 
	  	if @provider.save
      		flash[:success] = "creado con exito" 	  		
	    	redirect_to  @provider
	  	else
	    	render 'new'
	  	end
	end

	def edit
	  @provider = Provider.find(params[:id])
	end
	def update
	  @provider = Provider.find(params[:id])
	  if @provider.update(provider_params)
      	flash[:success] = "actualizado  con exito" 	  	
	    redirect_to providers_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @provider = Provider.find(params[:id])
	  @provider.destroy	 
	  redirect_to providers_path
	end

	private
	  def provider_params
	    params.require(:provider).permit(:nombre_proveedor, :rut, :razon_social, :direccion, :email, :giro, :fono)
	  end
	  def require_certain_role
	  	if current_devise_user.role=='cliente' || current_devise_user.role=='veterinario'||current_devise_user.role=='peluquero' 
	  		flash[:error]="No esta autorizado para acceder a esta pagina"
	  		redirect_to root_path

	  	end  		
	  end
end