class ProductsController < ApplicationController

  def index 
    @provider=Provider.find(params[:id])
    @products =Product.all

  end

  def prod_info
    @product=Product.find(params[:id])   
  end

  def new
    @provider=Provider.where(id: params[:proveedor]).first  
    @product = Product.new
  end
  
  def create
    @provider= Provider.find(params[:provider_id])
    @product= @provider.products.new(product_params)
      if @product.save
      flash[:success] = "creado con exito"      
      redirect_to providers_path
    else
      render 'edit'
    end
  end

  def edit
    @product =Product.find(params[:id])
    @provider = Provider.all.where( ["id =?", @product.provider_id] ).first
  end

  def update
    @provider = Provider.find(params[:provider_id])
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Updateado con exito"      
      redirect_to providers_path
    else
      render 'edit'
    end
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
