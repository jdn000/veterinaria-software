class AttentionsController < ApplicationController
 before_action :require_activated
 before_action :require_certain_role
  def index
    @mis_consultas = Attention.where(user_id: current_user.id)
    @clientes=Array.new
    @mascotas=Array.new
    @attention=Attention.new
    @hour_reservations=HourReservation.all
    @fichas = Array.new 
  end

  def new
    @pet=Pet.all
    @attention = Attention.new
    @clientes=User.where( role:'cliente')

  end
  def create
     @attention=Attention.new(attention_params)
    if @attention.save
       flash[:success]= 'Ficha creada con exito'
       redirect_to attentions_path
    else
       flash[:error]= 'Error en el ingreso'
       # redirect_to new_attention_path
       @mascotas= Pet.where(user_id: @attention.cliente.to_i)
       @a=String.new
       @a=@attention.cliente
       @cliente=User.find(@a.to_i)
       render 'existente', id: @a.to_i
    end
  end
  def existente
    @cliente=User.find_by(id: params[:id])
    @mascotas= Pet.where(user_id: @cliente.id)
    @attention=Attention.new
  end

  def nuevo
    @attention=Attention.new
   end

  def buscar
    @attentions=Attention.all
  end

  def mostrar
    @attention=Attention.find(params[:id])
    @cliente=User.find_by(rut: @attention.nombre_mascota)
    @mascota=Pet.find( @attention.mascota )
    @especialista=@attention.user
  end
def mis_fichas
  @attentions=Attention.where(user_id: current_user.id)
end
def search
    @attentions = Attention.where(nombre_mascota: params[:search]).order("created_at DESC")
    if @attentions.nil?
         @attentions = Attention.where(nombre_mascota: params[:search]).order("created_at DESC")
       end
end
private

    def attention_params
    params.require(:attention).permit(:tipo_atencion,:hora_atencion, :descripcion,:cliente, :mascota, :user_id,:nombre,:nombre_mascota,:celular)
    end

    def require_activated
      if !current_user.activado? 
        flash[:error]="Usuario no existe [401]"
        redirect_to root_path

      end     
    end 
    def require_certain_role
      if current_user.role=='cliente' ||current_user.role=='peluquero' 
        flash[:error]="No esta autorizado para acceder a esta pagina"
        redirect_to root_path
      end     
    end
end
