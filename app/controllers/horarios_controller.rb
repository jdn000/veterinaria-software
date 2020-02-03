class HorariosController < ApplicationController
 before_action :require_certain_role
  before_action :require_activated
  def index
    @especialistas=User.where.not(role: %w(cliente admin), activado: false , role: nil )
    @horarios = Horario.all
  end
def new
    @user=User.find(params[:id])
    @horario = Horario.new
    @jornada= params[:jornada]
 end
 
  def create

    @horario = Horario.create(horario_params)
    if @horario.entrada < @horario.salida
      
        if @horario.save
          flash[:success] = "Horario guardado"        
          redirect_to horarios_path
        else
          flash[:error] = "No se guardo el horario"
          render 'new'
        end
    else
      flash[:error]= "El horario de entrada debe ser menor que el de salida"
      redirect_to new_horario_path(:id => @horario.user_id )
      end 
  end

  def edit
    @horario=Horario.find(params[:id])
    @user=@horario.user
  end

  def update

     @horario=Horario.find(params[:id])
     if @horario.entrada < @horario.salida
      
        if @horario.update(horario_params)
          flash[:success] = "Horario guardado"        
          redirect_to horarios_path
        else
          flash[:error] = "No se guardo el horario"
          render 'new'
        end
    else
      flash[:error]= "El horario de entrada debe ser menor que el de salida"
      redirect_to new_horario_path(:id => @horario.user_id )
      end 
  end

  def destroy
    @horario.destroy

    redirect_to Horarios_path
  end

  private

  def horario_params
    params.require(:horario).permit(:entrada,:salida, :user_id)
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
