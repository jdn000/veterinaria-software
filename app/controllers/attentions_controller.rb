class AttentionsController < ApplicationController
  before_action :set_attention, only: [:show,:destroy,:edit,:update]
  before_action :authenticate_user!

  def new
    @attention = Attention.new
  end
  def index
    @attentions = Attention.all
  end

  def show
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

    redirect_to attentions_path
  end

  private

  def attention_params
    params.require(:attention).permit(:tipo_atencion, :descripcion, :hour_id, :pet_id, :user_id)
  end

  def set_attention
    @attention = Attention.find(params[:id])
  end

end
