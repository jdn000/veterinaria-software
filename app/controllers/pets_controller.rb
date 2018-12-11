class PetsController < ApplicationController

    def index
      @user=current_user
	  @pets = Pet.where("user_id = ?",current_user.id)

	end

	def show
		@user=current_user
		@pet = Pet.find(params[:id])
	end

	def new
		@user=current_user
		@pet =Pet.new
	end

	def create
		@user=current_user
	  	@pet = @user.pet.new(pet_params)
	  	if @pet.save
        flash[:success] = "Su mascota ha sido inscrita exitosamente"	  		
	    	redirect_to user_pets_path
	  	else
        flash[:error] = "Ha  ocurrido un error"
	    	render 'new'
	  	end
	end


	def edit
	  @user=current_user		
	  @pet = Pet.find(params[:id])
	end


	def update
	  @user=current_user
	  @pet = Pet.find(params[:id])
	 
	  if @pet.update(pet_params)

	    	redirect_to user_pets_path
	  else
	    render 'edit'
	  end
	end


	def destroy
	  @pet = Pet.find(params[:id])
	  @pet.destroy
	 
	    	redirect_to user_pets_path #devuelve al index
	end



	private
	  def pet_params
	    params.require(:pet).permit(:nombre, :tipo_mascota, :sexo, :raza, :edad)
	  end
end
