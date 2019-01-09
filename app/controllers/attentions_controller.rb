class AttentionsController < ApplicationController

 before_action :set_attention, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  # GET /attentions
  # GET /attentions.json
  def index
    @attentions = Attention.all
    @hour_reservations=HourReservation.all
    @fichas = Array.new
    @x=1
    @hour_reservations.each do |hour|
      if hour.especialidad == current_user.role
        @fichas.push(hour)
      end
    end

  end

  def show
  end

  def new
    @attention = Attention.new
    @id_hora = params[:id]

  end
  def create
    @attention = Attention.create(attention_params)
    respond_to do |format|
      format.html {redirect_to attentions_path}
      format.js
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @attention.update(attention_params)
        format.html { redirect_to attentions_path,  notice: 'Se actualizaron los datos'}
      else
        render 'edit'
      end
    end
  end

  def destroy
    @attention.destroy
    respond_to do |format|
      format.html { redirect_to attentions_url, notice: 'attention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def attention_params
    params.require(:attention).permit(:tipo_atencion, :descripcion, :hour_id, :pet_id, :user_id, :admin_id)
    end
    def hour_params
      params.require(:hour_reservation).permit(:fecha_reserva,:hora_reserva,:user_id,:pet_id,:especialidad) 
    end
    def set_attention
      @attention = Attention.find(params[:id])
    end


end
