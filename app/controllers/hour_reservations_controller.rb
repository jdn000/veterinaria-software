class HourReservationsController < ApplicationController
def index
	@hour_reservations=HourReservation.all
	@horas_cliente=Array.new
	@hour_reservations.each do |hour|
		if hour.pet.user.id == current_user.id
			@horas_cliente.push(hour)
		end
	end	
end
def new

	@fecha=params[:fecha].to_date
	@hora=Time.at(params[:hora].to_i)
	@especialidad=params[:especialidad]
	@veterinario=User.where(role: 'veterinario').first
	@pets=Pet.where(user_id: current_user.id).all
	@hour_reservation=HourReservation.new

end
def create
	@pet=Pet.where(id: params[:pet_id]).first
	@veterinario=User.where(role: 'veterinario').first
	@especialidad=params[:especialidad]	
	@hour_reservation=HourReservation.new(hour_params)
	@hour_reservations=HourReservation.all
	@count_hour=Array.new
	@count_times=Array.new
	@count_pairing=Array.new
	@hour_reservations.each do |hour|
		if hour.pet == @hour_reservation.pet
			@count_hour.push(hour)
		end
	end
	@count_hour.each do |count|
		 if  count.especialidad == @hour_reservation.especialidad && count.fecha_reserva > Date.today
				@count_times.push(count)
		end
		if count.fecha_reserva == @hour_reservation.fecha_reserva && count.hora_reserva == @hour_reservation.hora_reserva
			@count_pairing.push(count)
		end 

	end	
    
    if @count_hour.count >2
    	flash[:error]= "Excede maximo de horas"
    	redirect_to hour_reservations_path(current_user)
    elsif @count_times.count>1
     	flash[:error]= "Excede maximo horas por especialidad"
    	redirect_to hour_reservations_path(current_user)
    elsif @count_pairing.count>0
     	flash[:error]= "No se puede tomar misma hora para distintos especialistas"
    	redirect_to hour_reservations_path(current_user)    	
    else
    	if @hour_reservation.save  
      		flash[:success] = "Hora tomada con exito "  
	        redirect_to hour_reservations_path
      	else
      		flash[:error] = "Error en el ingreso "  
     		 render 'dateconfirm'
     	 end
    end

end	
def datesearch

	@fechas=HourReservation.where(fecha_reserva: params[:fecha])
	if @fechas.empty?
	begin
	  @dia=HourReservation.new(fecha_reserva: ((params[:fecha]).to_s).to_date)
	rescue ArgumentError => e
	  flash[:error] = "Debe ingresar una fecha"
	  redirect_to hour_reservations_path
	  return
	end  	
		if @dia.fecha_reserva.sunday?
			flash[:error]="domingo cerrado"
			redirect_to hour_reservations_path
		elsif !(Holidays.on(@dia.fecha_reserva,:cl).empty?)
			flash[:error]= "Dia feriado"
			redirect_to hour_reservations_path
		elsif @dia.fecha_reserva<Date.today
				flash[:error]='fecha invalida'
				redirect_to hour_reservations_path
		else
			
		end
	end
 

end

def edit
end
def update
end
def delete
end
private

def hour_params
	params.require(:hour_reservation).permit(:fecha_reserva,:hora_reserva,:reservada,:user_id,:pet_id,:especialidad)
end


end