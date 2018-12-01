class ProductsController < ApplicationController


#no permitir borrar coomentarios 
  http_basic_authenticate_with name: "cloud", password: "123", only: :destroy	
  def create
    @provider = Provider.find(params[:provider_id])
    @product = @provider.products.create(product_params)
    redirect_to provider_path(@provider)
  end
 
  def destroy
    @provider = Provider.find(params[:provider_id])
    @product = @provider.products.find(params[:id])
    @product.destroy
    redirect_to provider_path(@provider)
  end
	private
	  def product_params
	    params.require(:product).permit(:nombre_producto, :tipo_producto, :descripcion, :cantidad, :caducidad)
	  end



end
