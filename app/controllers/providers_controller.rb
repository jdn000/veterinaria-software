class ProvidersController < ApplicationController

	# autentificacion 
#http_basic_authenticate_with name: "cloud", password: "123", except: [:index, :show]
	def index
	  @providers = Provider.all
	end


	def show
		@provider = Provider.find(params[:id])
	end

	def new
		@provider = Provider.new

	end

	def create
	  	@provider = Provider.new(provider_params)
	 
	  	if @provider.save
	    	redirect_to @provider
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
	    redirect_to @provider
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

end