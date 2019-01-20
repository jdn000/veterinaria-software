class ProvidersController < ApplicationController
	before_action :set_provider, only: [:show,:destroy,:edit,:update]
	before_action :authenticate_user!
 	before_action :require_activated
	def new
		@provider = Provider.new
	end

	def index 
	  @providers = Provider.all
	end
    def show
	end

	def edit
	end    
	def destroy
		@provider.destroy

		redirect_to providers_path
	end	
	def create
		@provider = Provider.create(provider_params)

		respond_to do |format|
				format.html {redirect_to providers_path}
				format.js
		end
	end

	def update
		respond_to do |format|
			if @provider.update(provider_params)
				format.html { redirect_to providers_path, notice: 'Se actualizaron los datos'}
			else
				render 'edit'
			end
		end
	end


	private
	  def provider_params
	    params.require(:provider).permit(:nombre_proveedor, :rut, :razon_social, :direccion, :email, :giro, :fono)
	  end
	def set_provider
		@provider = Provider.find(params[:id])
	end
	  def require_activated
	  	if !current_user.activado? 
	  		flash[:error]="Usuario no existe [401]"
	  		redirect_to root_path

	  	end  		
	  end	
end







