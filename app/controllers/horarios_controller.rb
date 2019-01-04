class HorariosController < ApplicationController

  def index
    @especialistas=User.all
    @horarios = Horario.all
  end
def new
    @user=User.find(params[:id])
    @horario = Horario.new
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

  def set_Horario
    @horario = Horario.find(params[:id])
  end
end
