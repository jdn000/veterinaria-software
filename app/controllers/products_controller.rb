class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:destroy,:edit,:update]
  before_action :authenticate_user!

  def new
    @product = Product.new
  end
  def index
    @products = Product.all
  end

  def show
  end



  def create
    @product = Product.create(product_params)

    respond_to do |format|
      format.html {redirect_to products_path}
      format.js
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path,  notice: 'Se actualizaron los datos'}
      else
        render 'edit'
      end
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:nombre_producto, :tipo_producto, :descripcion, :cantidad, :caducidad, :provider_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

