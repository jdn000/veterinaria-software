class HourReservationsController < ApplicationController
def index
	@hour_reservations=HourReservation.all
	
	if current_user.role == 'veterinario' || current_user.role == 'peluquero'
		@horas_especialista=Array.new
	 	current_user.hour_reservations.each do |n|
	 		if n.fecha_reserva == Date.today
	 			@horas_especialista.push(n)
	 		end
		
		end
		@horas_especialista.sort_by{ |t| t.fecha_reserva.day } 	

	elsif current_user.role == 'cliente'
		@horas_cliente=Array.new
	    @hour_reservations.each do |hour|
			if hour.pet.user.id == current_user.id
				@horas_cliente.push(hour)
			end
		end	
	elsif current_user.role == 'trabajador' ||current_user.role == 'admin'
		@horas_dia=Array.new
	    @hour_reservations.each do |dia|
	    	if Date.today.sunday? || Holidays.on(Date.today,:cl).empty? == false
	    		flash[:error]="Hoy no se atiende"
	    	else
	    		if dia.fecha_reserva == Date.today
					@horas_dia.push(dia)
				end	
	    	end			
		end
		@horas_dia.sort_by{ |t| t.fecha_reserva.day }
	end		
end				

def new

	@fecha=params[:fecha].to_date
	@hora=Time.at(params[:hora].to_i)
	@especialidad=params[:especialidad].downcase
	@especialistas=User.where(role: @especialidad)
	@esp_disp=Array.new
	@especialistas.each do |especialista|
		if @hora.between?( especialista.horario.entrada , especialista.horario.salida )
				@esp_disp.push( especialista )
		end
	end
	@pets=Pet.where(user_id: current_user.id).all
	@hour_reservation=HourReservation.new

end

def create
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
    elsif @count_times.count>0
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
     		 redirect_to hour_reservations_path
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
	
def destroy
	@hour_reservation=HourReservation.find(params[:id])
	@hour_reservation.destroy
	flash[:success]='Hora eliminada exitosamente'
    redirect_to hour_reservations_path
end
private

def hour_params
	params.require(:hour_reservation).permit(:fecha_reserva,:hora_reserva,:user_id,:pet_id,:especialidad)
end


end