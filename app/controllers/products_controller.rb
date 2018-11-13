class ProductsController < ApplicationController


	def index
	  @products = Product.all
	end

	def create
	  @product = Product.new(product_params)
	 
	  @product.save
	  redirect_to @product
	end


	def show
		@product = Product.find(params[:id])
	end

	private
	  def product_params
	    params.require(:product).permit(:id_producto, :nombre_producto, :tipo_producto, :descripcion, :cantidad, :caducidad)
	  end



end
