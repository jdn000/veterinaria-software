class UsersController < ApplicationController
 before_action :allow_without_password, only: [:update]	
 before_action :require_certain_role
 before_action :require_activated
	def index
     @users=User.where("role = ? OR role = ? OR role = ? AND activado = ?",'trabajador','peluquero','veterinario', true)
	end
	def indexc
     @users=User.where(role: "cliente")
	end	
    def show
	@user=User.find(params[:id])
    end
	def new
		@user=User.new
	end

	def create
	    @user = User.new(usuario_params)

	  	  if @user.save
		  	redirect_to users_path
		  else
		  	flash[:error]="error en el ingreso"
		  	redirect_to users_path
		  end

	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
	  if @user.update(usuario_params)
      	flash[:success] = "actualizado  con exito" 	  	
	    redirect_to users_path
	  else
	    render 'edit'
	  end
	end	

private

	  def usuario_params
	    params.require(:user).permit(:email, :password, :password_confirmation,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular,:role,:comuna,:activado)
	  end
    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
    end

	  def require_certain_role
	  	if current_user.role=='cliente' || current_user.role=='veterinario'||current_user.role=='peluquero' 
	  		flash[:error]="No esta autorizado para acceder a esta pagina"
	  		redirect_to root_path
	  	end  		
	  end
	  
	  def require_activated
	  	if !current_user.activado? 
	  		flash[:error]="Usuario no existe [401]"
	  		redirect_to root_path

	  	end  		
	  end	  

end
