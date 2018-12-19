class UsersController < ApplicationController
 before_action :allow_without_password, only: [:update]	
before_action :require_certain_role
	def index
     @users=User.where.not(role: "admin")
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
      		flash[:success] = "creado con exito" 	  		
	    	redirect_to  users_path
	  	else
	    	render 'new'
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
	    params.require(:user).permit(:email, :password, :password_confirmation,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular,:role,:comuna)
	  end
    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
    end

	  def require_certain_role
	  	if current_devise_user.role=='cliente' || current_devise_user.role=='veterinario'||current_devise_user.role=='peluquero' 
	  		flash[:error]="No esta autorizado para acceder a esta pagina"
	  		redirect_to root_path

	  	end  		
	  end

end
